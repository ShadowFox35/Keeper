import 'package:core/src/permissions/permission_manager.dart';
import 'package:core/src/permissions/permissions.dart';

class PermissionManagerImpl implements PermissionManager {
  @override
  PermissionProvider get camera => CameraPermissionProvider();

  @override
  PermissionProvider get storage => StoragePermissionProvider();
}
