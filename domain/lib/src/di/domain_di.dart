import 'package:core/core.dart';

abstract class DomainDI {
  static void initDependencies(GetIt appLocator) {
    _initUseCases(appLocator);
  }

  static void _initUseCases(GetIt locator) {}
}
