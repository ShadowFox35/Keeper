import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'scanner_state.dart';

class ScannerCubit extends Cubit<ScannerState> {
  final AppRouter _appRouter;
  final ChooseImageUseCase _chooseImageUseCase;
  final PermissionManager _permissionManager;
  final ImagePickerService _imagePickerService;

  ScannerCubit({
    required AppRouter appRouter,
    required ChooseImageUseCase chooseImageUseCase,
    required PermissionManager permissionManager,
    required ImagePickerService imagePickerService,
  })  : _appRouter = appRouter,
        _chooseImageUseCase = chooseImageUseCase,
        _permissionManager = permissionManager,
        _imagePickerService = imagePickerService,
        super(ScannerState.init()) {
    _init();
  }

  Future<void> _init() async {}

  // Future<void> onChooseImagePressed() async {
  //   final String imagePath =
  //       await _chooseImageUseCase.execute(const NoPayload());
  //
  //   emit(
  //     state.copyWith(
  //       imagePath: imagePath,
  //     ),
  //   );
  // }

//TODO refactor
  Future<void> handleAddImageFromCamera() async {
    final PermissionProvider cameraProvider = _permissionManager.camera;
    bool isCameraGranted = await cameraProvider.status.isGranted;

    if (!isCameraGranted) {
      isCameraGranted = await cameraProvider.request().isGranted;
    }

    if (isCameraGranted) {
      final XFile? photo = await _imagePickerService.pickImageFromCamera();
      emit(
        state.copyWith(
          imagePath: photo?.path,
        ),
      );
    }
  }

// Future<void> handleAddFilesFromStorage() async {
//   final bool isIOS = Platform.isIOS;
//   late final Map<Permission, PermissionStatus> permisionStatus;
//   if (isIOS) {
//     final PermissionProvider storageProvider = _permissionManager.storage;
//     bool isStorageGranted = await storageProvider.status.isGranted;
//     if (!isStorageGranted) {
//       isStorageGranted = await storageProvider.request().isGranted;
//     }
//     if (isStorageGranted) {
//       await _pickFiles();
//     }
//   } else {
//     final AndroidDeviceInfo androidInfo =
//         await DeviceInfoPlugin().androidInfo;
//     if (androidInfo.version.sdkInt <= 32) {
//       permisionStatus = await <Permission>[Permission.storage].request();
//     } else {
//       permisionStatus = await <Permission>[
//         Permission.storage,
//         Permission.photos,
//         Permission.notification
//       ].request();
//     }
//     bool allAccepted = true;
//     permisionStatus.forEach((Permission key, PermissionStatus value) async {
//       if (value != PermissionStatus.granted) {
//         allAccepted = false;
//       }
//     });
//     if (allAccepted) {
//       await _pickFiles();
//     }
//   }
// }
}
