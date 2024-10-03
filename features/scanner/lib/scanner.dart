library scanner;

import 'package:navigation/navigation.dart';
import 'package:scanner/scanner.gm.dart';

export 'package:scanner/scanner.gm.dart';
export 'package:scanner/src/scanner_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Form,Route')
class ScannerModule extends $ScannerModule {}
