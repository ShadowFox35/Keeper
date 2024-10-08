import 'dart:async';

import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'package:keeper/keeper_app.dart';
import 'package:navigation/navigation.dart';

Future<void> mainCommon(Flavor flavor) async {
  await runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await _setupDI(flavor);

    runApp(const KeeperApp());
  }, (Object object, StackTrace stackTrace) {});
}

Future<void> _setupDI(Flavor flavor) async {
  appLocator.pushNewScope(
    scopeName: unauthScope,
    init: (_) async {
      AppDI.initDependencies(appLocator, flavor);
      await DataDI.initDependencies(appLocator);
      DomainDI.initDependencies(appLocator);
      NavigationDI.initDependencies(appLocator);
    },
  );

  await appLocator.allReady();
}

