import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppLoader extends StatelessWidget {
  const AppLoader();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
