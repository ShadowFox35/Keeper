library settings;

import 'package:navigation/navigation.dart';
import 'package:settings/settings.gm.dart';

export 'package:settings/settings.gm.dart';
export 'package:settings/src/settings_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Form,Route')
class SettingsModule extends $SettingsModule {}
