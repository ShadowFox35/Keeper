import 'package:get_it/get_it.dart';
import 'package:core/core.dart';
import 'package:navigation/navigation.dart';

final AppDI appDI = AppDI();
final GetIt appLocator = GetIt.instance;

class AppDI {
  void initDependencies(Flavor flavor) {
    appLocator.registerSingleton<AppConfig>(
      AppConfig.fromFlavor(flavor),
    );
    initNavigationDependencies();
  }
}
