import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:settings/settings.dart';
import 'package:scanner/scanner.dart';
import 'package:profile/profile.dart';

@RoutePage<String>()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        ProfileRoute(),
        ScannerRoute(),
        SettingsRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.limeAccent,
            currentIndex: tabsRouter.activeIndex,
            selectedItemColor: Colors.redAccent,
            unselectedItemColor: Colors.amber,
            onTap: tabsRouter.setActiveIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.scanner_sharp,
                ),
                label: 'Scanner',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }
}
