import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_prj/Const/auth_controller.dart';
import 'package:my_prj/Const/constants.dart';
import 'package:my_prj/Const/lists.dart';
import 'package:my_prj/views/home/home_screen.dart';
import 'package:my_prj/widget_common/applogo_widget.dart';
import 'package:my_prj/widget_common/custom_textfield.dart';
import 'package:my_prj/widget_common/our_button.dart';

import '../home/home.dart';
import '../signup_screen.dart';
class LoginScreen extends StatelessWidget{
  const LoginScreen ({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
  var controller = Get.put(AuthController());
  return Scaffold(
    backgroundColor: Colors.white,
    body: Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (context.screenHeight * 0.1).heightBox,
            applogoWidget(),
            10.heightBox,
            "Artistic Shop".text.fontFamily(bold).color(pinkAccent).size(20).make(),
            30.heightBox,
            Obx(() => Column(
              children: [
                customTextField(hint: emailHint, title: email, controller: controller.emailController, ispass: false),
                customTextField(hint: passwordHint, title: password, controller: controller.passwordController, ispass: true),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: forgetPass.text.make(),
                  ),
                ),
                5.heightBox,
                controller.isloading.value
                    ? const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(pinkAccent))
                    : ourButton(
                        color: pinkAccent,
                        title: login,
                        textcolor: whiteColor,
                        onPress: () async {
                          controller.isloading(true);
                          await controller.loginMethod(context: context).then((value) {
                            if (value != null) {
                              VxToast.show(context, msg: loggedin);
                              Get.offAll(const Home());
                              controller.isloading(false);
                            } else {
                              controller.isloading(false);
                            }
                          });
                        },
                      ).box.width(context.screenWidth - 50).make(),
                5.heightBox,
                createNewAccount.text.color(fontGrey).make(),
                5.heightBox,
                ourButton(
                  color: fontGrey,
                  title: signup,
                  textcolor: whiteColor,
                  onPress: () {
                    Get.to(() => const SignupScreen());
                  },
                ).box.width(context.screenWidth - 50).make(),
                5.heightBox,
                loginWith.text.color(fontGrey).make(),
                5.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: lightGrey,
                        radius: 25,
                        child: Image.asset(socialIconList[index], width: 30),
                      ),
                    ),
                  ),
                )
              ],
            ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth - 70).shadow3xl.make())],
        ),
      ),
    ),
  );
}
}