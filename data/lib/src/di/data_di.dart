import 'package:core/core.dart';
import 'package:data/src/provider/api_provider.dart';
import 'package:data/src/repository_impl/scanner_repository_impl.dart';
import 'package:domain/domain.dart';

abstract class DataDI {
  static Future<void> initDependencies(GetIt appLocator) async {
    await _initApi(appLocator);
    _initProviders(appLocator);
    _initRepositories(appLocator);
  }

  static Future<void> _initApi(GetIt appLocator) async {
    appLocator.registerLazySingleton<DioConfig>(
      () => DioConfig(
        appConfig: appLocator<AppConfig>(),
      ),
    );
  }

  static void _initProviders(GetIt appLocator) {
    appLocator.registerLazySingleton<ApiProvider>(
      () => ApiProvider(appLocator<DioConfig>().dio),
    );
  }

  static void _initRepositories(GetIt appLocator) {
    appLocator.registerLazySingleton<ScannerRepository>(
      () => ScannerRepositoryImpl(appLocator<ApiProvider>()),
    );
  }
}
