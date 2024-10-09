import 'package:permission_handler/permission_handler.dart';

abstract interface class PermissionProvider {
  Future<PermissionStatus> get status;

  Future<PermissionStatus> request();
}
