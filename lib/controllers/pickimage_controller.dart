

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PickImageController extends GetxController{

  RxString imagePath = ''.obs;
  
  Future getImage() async{
    final ImagePicker pickimage = ImagePicker();
    final image = await pickimage.pickImage(source: ImageSource.gallery);
    if(image != null){
      imagePath.value = image.path.toString();
    }
  }
}