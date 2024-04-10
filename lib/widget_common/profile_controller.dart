import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_prj/Const/constants.dart';

class profileController extends GetxController{
  var profileImagePath=''.obs;

  var nameController= TextEditingController();
  var passController= TextEditingController();

  changeImage(context)async{
    try{
      final img=await ImagePicker().pickImage(source:ImageSource.gallery , imageQuality:70);
      if(img==null)return;
      profileImagePath=img.path as RxString;
    }
    on PlatformException catch(e){
      VxToast.show(context, msg: e.toString());
    }
  }
//uploadProfileImage

 }