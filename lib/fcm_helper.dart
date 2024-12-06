import 'dart:math';
import 'dart:typed_data';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

abstract class IFcmService {
  handleNotificationClick(RemoteMessage message);
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class MessagingService extends ChangeNotifier {
  final IFcmService _fcmService;

  String? _fcmToken = '';
  String? get fcmToken => _fcmToken;

  MessagingService({
    required IFcmService fcmResources,
  }) : _fcmService = fcmResources;
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  Future<void> init() async {
    _fcm.subscribeToTopic('topic1');
    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    await _fcm.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    switch (settings.authorizationStatus) {
      case AuthorizationStatus.authorized:
        {
          break;
        }
      case AuthorizationStatus.provisional:
        {
          break;
        }
      case AuthorizationStatus.denied:
        {
          flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>()
              ?.requestNotificationsPermission();
          break;
        }
      case AuthorizationStatus.notDetermined:
        {
          flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>()
              ?.requestNotificationsPermission();
          break;
        }
    }
    // Retrieving the FCM token
    _fcmToken = await _fcm.getToken();
    print('fcm_helper > ' 'fcmToken: $fcmToken');

    AndroidNotificationChannel channel = AndroidNotificationChannel(
      'fcm_default_channel',
      'fcm_default_channel',
      description: 'Your Channel Description',
      importance: Importance.max,
      sound: const RawResourceAndroidNotificationSound('alarm'),
      playSound: true,
      enableVibration: true,
      vibrationPattern: Int64List.fromList([0, 1000, 500, 1000]),
    );
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    // Handling background messages using the specified handler
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    // Listening for incoming messages while the app is in the foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('ic_launcher');

      const InitializationSettings initializationSettings =
          InitializationSettings(
              // android: initializationSettingsAndroid,
              );

      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (payload) {
          _handleNotificationClick(message);
        },
      );
      displayNotification(message);
    });
    // Handling the initial message received when the app is launched from dead (killed state)
    // When the app is killed and a new notification arrives when user clicks on it
    // It gets the data to which screen to open
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        _handleNotificationClick(message);
      }
    });
    // Handling a notification click event when the app is in the background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('fcm_helper > ' 'A new onMessageOpenedApp event was published');
      _handleNotificationClick(message);
    });
  }

// Handler for background messages
  @pragma('vm:entry-point')
  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    debugPrint('fcm_helper > ' 'Handling a background message: $message');
  }

  void displayNotification(RemoteMessage message) async {
    Random random = Random();
    int id = random.nextInt(900) + 10;
    NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: AndroidNotificationDetails(
          'fcm_default_channel',
          'fcm_default_channel',
          channelDescription: 'Your Channel Description',
          channelShowBadge: true,
          playSound: true,
          priority: Priority.high,
          importance: Importance.max,
          enableVibration: true,
          vibrationPattern: Int64List.fromList([0, 1000, 500, 1000]),
          sound: const RawResourceAndroidNotificationSound('alarm'),
        ),
        iOS: const DarwinNotificationDetails(
          presentBadge: true,
          presentSound: true,
          presentAlert: true,
          badgeNumber: 1,
        ));

    await flutterLocalNotificationsPlugin.show(
      id,
      message.notification?.title ?? message.data["title"] ?? "",
      message.notification?.body ?? message.data["message"] ?? "",
      platformChannelSpecifics,
    );
  }

  void _handleNotificationClick(RemoteMessage message) {
    print('fcm_helper > ' 'Handling a notification click');
    print('fcm_helper > ' 'message.data: ${message.data}');
    _fcmService.handleNotificationClick(message);
  }
}
