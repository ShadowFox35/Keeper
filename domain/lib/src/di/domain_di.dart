import 'package:core/core.dart';
import 'package:domain/domain.dart';

abstract class DomainDI {
  static void initDependencies(GetIt appLocator) {
    _initUseCases(appLocator);
  }

  static void _initUseCases(GetIt appLocator) {
    appLocator.registerLazySingleton<ChooseImageUseCase>(
      () => ChooseImageUseCase(
          scannerRepository: appLocator<ScannerRepository>()),
    );
  }
}
