import 'package:auto_route/auto_route.dart';
import 'package:home/home.dart';
import 'package:profile/profile.dart';
import 'package:settings/settings.dart';
import 'package:scanner/scanner.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Form|Screen|Step,Route',
  modules: [
    HomeModule,
    ProfileModule,
    SettingsModule,
    ScannerModule,
  ],
)
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
          children: [
            AutoRoute(
              page: ProfileRoute.page,
            ),
            AutoRoute(
              page: SettingsRoute.page,
            ),
            AutoRoute(
              page: ScannerRoute.page,
            ),
          ],
        ),
      ];
}
