import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_prj/Const/constants.dart';
import 'package:my_prj/Const/images.dart';
import 'package:my_prj/widget_common/bg_widget.dart';
import 'package:my_prj/widget_common/custom_textfield.dart';
import 'package:my_prj/widget_common/our_button.dart';
import 'package:my_prj/widget_common/profile_controller.dart';



class EditProfile extends StatelessWidget{
  final dynamic data;
  const EditProfile({Key? key,this.data}): super(key:key);

  @override
  Widget build(BuildContext context){
    var controller= Get.find<profileController>();
    controller.nameController.text=data['name'];
    controller.passController.text=data['password'];
    
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(),
        body:Obx(() => Column(
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
              customTextField(hint:nameHint,title:name,ispass:false , controller: controller.nameController),
              customTextField(hint:passwordHint,title:password,ispass:true , controller: controller.passController),
              10.heightBox,
              ourButton(color: pinkAccent ,onPress: (){},textcolor: whiteColor, title: "Save"),
          ],
        ).box.white.shadow3xl.padding(const EdgeInsets.all(16)).margin(const EdgeInsets.only(right:12,left:12,top:50)).rounded.make()));
  }
}