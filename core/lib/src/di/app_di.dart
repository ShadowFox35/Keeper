import 'package:core/core.dart';

final GetIt appLocator = GetIt.instance;

const String unauthScope = 'unauthScope';
const String authScope = 'authScope';

abstract class AppDI {
  static void initDependencies(GetIt appLocator, Flavor flavor) {
    appLocator.registerSingleton<AppConfig>(
      AppConfig.fromFlavor(flavor),
    );
  }
}
