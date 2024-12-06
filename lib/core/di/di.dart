import 'package:get_it/get_it.dart';

import 'di.export.dart';

/// Instance of Get It
final GetIt getIt = GetIt.instance;

class DependencyInjection {
  static final DependencyInjection _singleton = DependencyInjection._();

  factory DependencyInjection() => _singleton;

  DependencyInjection._();

  Future<void> registerSingleton() async {
    /// create a instance of Hive

    /// register Repositories
    // --> FCM <--

    ServiceLocator().sl.registerLazySingleton(() => MessagingService(
          fcmResources: ServiceLocator().sl(),
        ));
  }
}
