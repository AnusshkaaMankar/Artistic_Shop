import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_prj/Const/constants.dart';
import 'package:my_prj/Const/images.dart';
import 'package:my_prj/Const/strings.dart';
import 'package:my_prj/account/account_screen.dart';
import 'package:my_prj/widget_common/bg_widget.dart';
import 'package:my_prj/widget_common/custom_textfield.dart';
import 'package:my_prj/widget_common/our_button.dart';
import 'package:my_prj/widget_common/profile_controller.dart';

class EditProfile extends StatelessWidget{
  final dynamic data;
  const EditProfile({Key? key,this.data}): super(key:key);
  @override
  Widget build(BuildContext context){
    var controller= Get.find<ProfileController>();    
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(),
        body:Obx(() => SingleChildScrollView(child:Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            controller.profileImagePath.isEmpty?Image.asset(
              icaccount,
              width:100,
              fit:BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make():Image.file(File(controller.profileImagePath.value),
              width:100,
              fit:BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              ourButton(color: pinkAccent ,onPress: (){
               controller.changeImage(context);
              },textcolor: whiteColor, title: "Change"),
              20.heightBox,
              const Divider(),
              customTextField(hint:nameHint,title:name,ispass:false, controller: controller.nameController),
              customTextField(hint:passwordHint,title:oldpassword,ispass:true , controller: controller.oldpassController),
              customTextField(hint:passwordHint,title:newpassword,ispass:true , controller: controller.newpassController),
              10.heightBox,
              controller.isloading.value? const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(pinkAccent)) :ourButton(color: pinkAccent ,onPress: ()async{
                controller.isloading(true);
                if(data['password']==controller.oldpassController.text){
                  await controller.changeAuthPassword(email: data['email'],
                  password:controller.oldpassController.text,
                  newpassword: controller.newpassController.text
                );
                 await controller.uploadProfile(
                  name: controller.nameController.text,
                  password: controller.newpassController.text
                );
                VxToast.show(context, msg:"updated");
                Get.to(AccountScreen());
                }else{
                  VxToast.show(context, msg:"Old password is mismatched");
                  controller.isloading(false);
                }
              },textcolor: whiteColor, title: "Save"),
          ],
        ).box.white.shadow3xl.padding(const EdgeInsets.all(16)).margin(const EdgeInsets.only(right:12,left:12,top:50)).rounded.make())));
  }
}
