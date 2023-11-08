import 'package:image_picker/image_picker.dart';

abstract class ImagePickerService {
  Future<String?> pickImage();
}

class ImagePickerServiceImpl implements ImagePickerService {
  @override
  Future<String?> pickImage() async {
    try {
      final imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      return imageFile?.path;
    } catch (e) {
      return null;
    }
  }
}
