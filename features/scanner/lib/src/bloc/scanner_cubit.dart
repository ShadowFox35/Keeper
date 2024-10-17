import 'dart:convert';
import 'dart:io';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'scanner_state.dart';

class ScannerCubit extends Cubit<ScannerState> {
  final AppRouter _appRouter;
  final SubmitImageUseCase _submitImageUseCase;
  final PermissionManager _permissionManager;
  final ImagePickerService _imagePickerService;

  ScannerCubit({
    required AppRouter appRouter,
    required SubmitImageUseCase submitImageUseCase,
    required PermissionManager permissionManager,
    required ImagePickerService imagePickerService,
  })  : _appRouter = appRouter,
        _submitImageUseCase = submitImageUseCase,
        _permissionManager = permissionManager,
        _imagePickerService = imagePickerService,
        super(ScannerState.init()) {
    _init();
  }

  Future<void> _init() async {}

  Future<void> deleteImages() async {
    emit(
      state.copyWith(
        imagePath: null,
      ),
    );
  }

  Future<void> handleAddImageFromCamera() async {
    final PermissionProvider cameraProvider = _permissionManager.camera;
    bool isCameraGranted = await cameraProvider.status.isGranted;

    if (!isCameraGranted) {
      isCameraGranted = await cameraProvider.request().isGranted;
    }

    if (isCameraGranted) {
      final XFile? pickResult = await _imagePickerService.pickImageFromCamera();

      if (pickResult != null) {
        emit(
          state.copyWith(
            imagePath: pickResult.path,
          ),
        );
      }
    }
  }

  Future<void> handleAddImageFromStorage() async {
    final PermissionProvider storageProvider = _permissionManager.storage;
    bool isStorageGranted = await storageProvider.status.isGranted;

    if (!isStorageGranted) {
      isStorageGranted = await storageProvider.request().isGranted;
    }

    if (isStorageGranted) {
      await _pickImage();
    }
  }

  Future<void> submitImages() async {
    TransactionEntity result = await _submitImageUseCase.execute(
        GetTransactionInfoPayload(base64image: await _convertImageToBase64()));
  }

  Future<void> _pickImage() async {
    final XFile? pickResult = await _imagePickerService.pickImageFromStorage();

    if (pickResult != null) {
      emit(
        state.copyWith(
          imagePath: pickResult.path,
        ),
      );
    } else {
      return;
    }
  }

  Future<String> _convertImageToBase64() async {
    final String? path = state.imagePath;
    if (path == null) {
      throw const AppException('imagePath is null');
    }
    final File imageFile = File(path);
    final List<int> imageBytes = await imageFile.readAsBytes();
    return base64Encode(imageBytes);
  }
}
