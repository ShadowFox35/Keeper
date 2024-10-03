library home;

import 'package:home/home.gm.dart';
import 'package:navigation/navigation.dart';

export 'package:home/home.gm.dart';
export 'package:home/src/home_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Form,Route')
class HomeModule extends $HomeModule {}