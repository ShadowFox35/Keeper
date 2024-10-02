library profile;

import 'package:navigation/navigation.dart';

import 'profile.gm.dart';
export 'profile.gm.dart';
export 'package:profile/src/profile_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Form,Route')
class ProfileModule extends $ProfileModule {}
