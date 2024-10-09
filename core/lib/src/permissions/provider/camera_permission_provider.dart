import 'package:core/core.dart';
import 'package:core/src/permissions/provider/permission_provider.dart';

class CameraPermissionProvider implements PermissionProvider {
  @override
  Future<PermissionStatus> request() async {
    return Permission.camera.request();
  }

  @override
  Future<PermissionStatus> get status async {
    return Permission.camera.status;
  }
}
