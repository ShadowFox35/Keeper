import 'package:core/core.dart';
import 'package:core/src/permissions/provider/permission_provider.dart';

class StoragePermissionProvider implements PermissionProvider {
  @override
  Future<PermissionStatus> request() async {
    return Permission.storage.request();
  }

  @override
  Future<PermissionStatus> get status async {
    return Permission.storage.status;
  }
}
