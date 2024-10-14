import 'dart:io';

import 'package:core/core.dart';
import 'package:device_info_plus/device_info_plus.dart';

class StoragePermissionProvider implements PermissionProvider {
  final bool isAndroid = Platform.isAndroid;

  @override
  Future<PermissionStatus> request() async {
    if (isAndroid) {
      AndroidDeviceInfo android = await DeviceInfoPlugin().androidInfo;

      return _getPermissionBasedOnSdk(android.version.sdkInt).request();
    } else {
      return Permission.storage.request();
    }
  }

  @override
  Future<PermissionStatus> get status async {
    if (isAndroid) {
      AndroidDeviceInfo android = await DeviceInfoPlugin().androidInfo;

      return _getPermissionBasedOnSdk(android.version.sdkInt).status;
    } else {
      return Permission.storage.status;
    }
  }

  Permission _getPermissionBasedOnSdk(int sdkInt) {
    if (sdkInt < 33) {
      return Permission.storage;
    } else {
      return Permission.photos;
    }
  }
}
