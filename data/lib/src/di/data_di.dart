import 'package:core/core.dart';

import 'package:data/src/errors/error_handler.dart';

abstract class DataDI {
  static Future<void> initDependencies(GetIt appLocator) async {
    await _initApi(appLocator);
  }

  static Future<void> _initApi(GetIt appLocator) async {
    appLocator.registerLazySingleton<DioConfig>(
      () => DioConfig(
        appConfig: appLocator<AppConfig>(),
      ),
    );

    appLocator.registerLazySingleton<ErrorHandler>(
      () => ErrorHandler(
        eventNotifier: appLocator<AppEventNotifier>(),
      ),
    );
  }
}
