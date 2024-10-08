import 'package:flutter/material.dart';

import 'package:navigation/navigation.dart';

@RoutePage<String>()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'SettingsScreen',
        ),
      ),
    );
  }
}
