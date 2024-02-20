import 'package:image_picker/image_picker.dart';

class ImagePickerUtils{
  final ImagePicker picker = ImagePicker();

  Future<XFile?> cameraCapture() async{
    final XFile? file = await picker.pickImage(source: ImageSource.camera);
    return file;
  }
  Future<XFile?> fromGallery() async{
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);
    return file;
  }
}