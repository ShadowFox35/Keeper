import 'package:core/core.dart';
import 'package:navigation/src/app_router/app_router.dart';

abstract class NavigationDI {
  static void initDependencies(GetIt appLocator) {
    appLocator.registerSingleton<AppRouter>(AppRouter());
  }
}
