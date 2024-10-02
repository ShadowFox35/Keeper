import 'package:flutter/material.dart';

import 'package:navigation/navigation.dart';

@RoutePage<String>()
class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'ScannerScreen',
          style: TextStyle(color: Colors.redAccent),
        ),
      ),
    );
  }
}
