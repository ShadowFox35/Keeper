import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> pickImageFromCamera() {
    return _picker.pickImage(
      source: ImageSource.camera,
    );
  }

  Future<List<XFile>> pickMultiImageFromGallery() {
    return _picker.pickMultiImage();
  }

  static Future<FilePickerResult?> pickFiles() async {
    try {
      return await FilePicker.platform.pickFiles(
        withData: true,
        type: FileType.custom,
        allowMultiple: true,
        allowedExtensions: <String>['png', 'jpg', 'jpeg', 'heic', 'pdf'],
      );
    } catch (error, stackTrace) {
      //TODO lig error
      // await ExceptionLogger.logError(
      //   message: error.toString(),
      //   stackTrace: stackTrace,
      // );
      return null;
    }
  }
}
