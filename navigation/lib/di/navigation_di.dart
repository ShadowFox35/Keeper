import 'package:navigation/app_router/app_router.dart';
import 'package:core/core.dart';

void initNavigationDependencies() {
  appLocator.registerSingleton<AppRouter>(AppRouter());
}
