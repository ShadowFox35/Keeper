import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> pickImageFromCamera() {
    return _picker.pickImage(
      source: ImageSource.camera,
    );
  }

  Future<XFile?> pickImageFromStorage() {
    return _picker.pickImage(
      source: ImageSource.gallery,
    );
  }
}
