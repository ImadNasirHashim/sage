import 'package:image_picker/image_picker.dart';
import 'package:sage/core/models/user.dart';
import 'package:sage/core/view_models/base_view_model.dart';

class ProfileProvider extends BaseViewModal{
  AppUser appUser = AppUser();
  XFile? image;

  final ImagePicker imagePicker = ImagePicker();

  pickImageFromGallery() async{
     image = await imagePicker.pickImage(source: ImageSource.gallery);
     notifyListeners();
  }
}