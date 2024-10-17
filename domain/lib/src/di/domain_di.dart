import 'package:core/core.dart';
import 'package:domain/domain.dart';

abstract class DomainDI {
  static void initDependencies(GetIt appLocator) {
    _initUseCases(appLocator);
  }

  static void _initUseCases(GetIt appLocator) {
    appLocator.registerLazySingleton<SubmitImageUseCase>(
      () => SubmitImageUseCase(
          scannerRepository: appLocator<ScannerRepository>()),
    );
  }
}
