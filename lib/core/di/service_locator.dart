import 'package:get_it/get_it.dart';

/// Instance of Get It

class ServiceLocator {
  final GetIt sl;
  ServiceLocator._({GetIt? sl}) : sl = sl ?? GetIt.instance;

  static final ServiceLocator _singleton = ServiceLocator._();

  factory ServiceLocator() => _singleton;

  factory ServiceLocator.init(GetIt sl) {
    return ServiceLocator._(sl: sl);
  }
}
