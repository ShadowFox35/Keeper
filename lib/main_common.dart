import 'dart:async';

import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';

import 'package:keeper/keeper_app.dart';

Future<void> mainCommon(Flavor flavor) async {
  await runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    appDI.initDependencies(flavor);
    await dataDI.initDependencies(flavor);

    runApp(const KeeperApp());
  }, (Object, StackTrace) {});
}
