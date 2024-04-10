import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_prj/Const/constants.dart';
import 'package:my_prj/views/home/home_screen.dart';
import 'package:my_prj/widget_common/applogo_widget.dart';

import '../auth_screen/login_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) :super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {

  changeScreen(){
    Future.delayed(const Duration(seconds:3),(){
        Get.to(() => const LoginScreen());

      auth.authStateChanges().listen((User? user){
      if(user==null && mounted){
        Get.to(() => const LoginScreen());
      }
      else{
        Get.to(() => const HomeScreen());

      }
    });
  });
  }
    @override
    void initState(){
    changeScreen();
    super.initState();
    }
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor:pinkAccent,
        body: Center(
        child: Column (
        children:[
        Align(alignment: Alignment.topLeft, child: Image.asset(icSplashBg, width:300)),
            20.heightBox,
          applogoWidget(),
          10. heightBox,
          appname.text.fontFamily(bold).size(22).white.make(),
        5.heightBox,
        appversion.text.white.make(),
        const Spacer(),
        credits.text.white.fontFamily(semibold).make(),
        30.heightBox,
//our splash screen UI is completed...
]
      ), // Column

      )
      );
    }}


