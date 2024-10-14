import 'dart:io';

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

  Future<void> deleteImages() async {
    emit(
      state.copyWith(
        imagePathList: <String>[],
      ),
    );
  }

//TODO refactor
  Future<void> handleAddImageFromCamera() async {
    final PermissionProvider cameraProvider = _permissionManager.camera;
    bool isCameraGranted = await cameraProvider.status.isGranted;

    if (!isCameraGranted) {
      isCameraGranted = await cameraProvider.request().isGranted;
    }

    if (isCameraGranted) {
      final List<String> filePathList = <String>[];
      final XFile? photo = await _imagePickerService.pickImageFromCamera();

      if (photo != null) {
        filePathList.add(photo.path);
        emit(
          state.copyWith(
            imagePathList: filePathList,
          ),
        );
      }
    }
  }

//TODO refactor
  Future<void> handleAddFilesFromStorage() async {
    final PermissionProvider storageProvider = _permissionManager.storage;
    bool isStorageGranted = await storageProvider.status.isGranted;

    if (!isStorageGranted) {
      isStorageGranted = await storageProvider.request().isGranted;
    }

    if (isStorageGranted) {
      await _pickFiles();
    }
  }

  Future<void> submitImages() async {
    String result = await storageProvider.status.isGranted;
  }

  Future<void> _pickFiles() async {
    final FilePickerResult? pickResult = await ImagePickerService.pickFiles();

    if (pickResult == null) {
      return;
    }
    final List<XFile> newFiles = _convertToXFiles(pickResult.files);
    final List<String> filePathList = _getFilePath(newFiles);
    emit(
      state.copyWith(
        imagePathList: filePathList,
      ),
    );
  }

//TODO maybe move to service?
  List<XFile> _convertToXFiles(List<PlatformFile> platformFiles) {
    return platformFiles
        .where((PlatformFile file) => file.bytes != null)
        .map(
          (PlatformFile file) => XFile.fromData(
            file.bytes!,
            name: file.name,
            length: file.size,
            path: file.path,
          ),
        )
        .toList();
  }

  List<String> _getFilePath(List<XFile> files) {
    return files.map((XFile file) => file.path).toList();
  }
}
