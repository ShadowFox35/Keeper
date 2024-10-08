import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:profile/profile.dart';
import 'package:scanner/scanner.dart';
import 'package:settings/settings.dart';

@RoutePage<String>()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const <PageRouteInfo>[
        ProfileRoute(),
        ScannerRoute(),
        SettingsRoute(),
      ],
      builder: (BuildContext context, Widget child) {
        final TabsRouter tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            // backgroundColor: AppTheme,
            currentIndex: tabsRouter.activeIndex,
            // selectedItemColor: Colors.redAccent,
            // unselectedItemColor: Colors.amber,
            onTap: tabsRouter.setActiveIndex,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.person,
                ),
                label: LocaleKeys.bottom_navigation_tabs_profile.tr(),
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.scanner_sharp,
                ),
                label: LocaleKeys.bottom_navigation_tabs_scanner.tr(),
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.settings,
                ),
                label: LocaleKeys.bottom_navigation_tabs_settings.tr(),
              ),
            ],
          ),
        );
      },
    );
  }
}
