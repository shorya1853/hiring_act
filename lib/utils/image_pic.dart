import 'package:image_picker/image_picker.dart';


pickedImage(ImageSource source) async {
  ImagePicker imageP = ImagePicker();

  XFile? _file = await imageP.pickImage(source: source);

  if (_file != null) {
    return await _file.readAsBytes();
  }
}
