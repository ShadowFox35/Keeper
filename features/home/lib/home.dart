library home;

import 'package:navigation/navigation.dart';

import 'home.gm.dart';
export 'home.gm.dart';
export 'package:home/src/home_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Form,Route')
class HomeModule extends $HomeModule {}