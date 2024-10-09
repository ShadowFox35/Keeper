import 'package:core/core.dart';

import 'package:core/src/permissions/permission_manager_impl.dart';

final GetIt appLocator = GetIt.instance;

const String unauthScope = 'unauthScope';
const String authScope = 'authScope';

abstract class AppDI {
  static void initDependencies(GetIt appLocator, Flavor flavor) {
    appLocator.registerSingleton<AppConfig>(
      AppConfig.fromFlavor(flavor),
    );
    _initServices(appLocator);
  }

  static void _initServices(GetIt appLocator) {
    appLocator.registerLazySingleton<ImagePickerService>(
      ImagePickerService.new,
    );

    appLocator.registerLazySingleton<PermissionManager>(
      PermissionManagerImpl.new,
    );
  }
}
