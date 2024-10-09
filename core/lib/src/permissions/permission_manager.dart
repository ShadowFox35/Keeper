import 'package:core/src/permissions/provider/permission_provider.dart';

abstract interface class PermissionManager {
  PermissionProvider get camera;

  PermissionProvider get storage;
}
