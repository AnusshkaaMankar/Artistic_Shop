import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:my_prj/Const/auth_controller.dart';
import 'package:my_prj/views/home/home.dart';
import 'package:my_prj/views/home/home_screen.dart';

import '../Const/constants.dart';
import '../Const/lists.dart';
import '../widget_common/applogo_widget.dart';
import '../widget_common/custom_textfield.dart';
import '../widget_common/our_button.dart';

class SignupScreen extends StatefulWidget{
  const SignupScreen({Key? key}): super(key:key);
  @override
  State<StatefulWidget> createState() => _SignupScreenState();

  }

class _SignupScreenState extends State<SignupScreen>{
  bool? isCheck=false ;
  var controller=Get.put(AuthController());

  var nameController=TextEditingController();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var retypePasswordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:whiteColor,
        resizeToAvoidBottomInset: false,
        body:Center(
            child:Column(
                children:[
                  (context.screenHeight*0.1).heightBox,
                  applogoWidget(),
                   10.heightBox,
              "Artistic Shop".text.fontFamily(bold).color(pinkAccent).size(20).make(),
                  10.heightBox,
                  "Join the Eshop".text.fontFamily(bold).white.size(10).make(),
                  10.heightBox,
                  Obx(()=>Column(
                      children:[
                        customTextField(hint: nameHint, title: name , controller: nameController,ispass:false ),
                        customTextField(hint: emailHint, title: email , controller: emailController , ispass: false),
                        customTextField(hint: passwordHint, title: password , controller: passwordController, ispass: true),
                        customTextField(hint:passwordHint, title:retypePassword , controller: retypePasswordController , ispass: true),
                        Align(
                            alignment:Alignment.centerRight,
                            child:TextButton(onPressed: (){
                            }, child: forgetPass.text.make())
                        ),
                        Row(
                            children:[
                              Checkbox(
                                activeColor:pinkAccent,
                                checkColor:pinkAccent,
                                value:isCheck,
                                onChanged: (newValue){
                                  setState(() {
                                    isCheck=newValue;
                                  });

                                },
                              ),
                              10.widthBox,
                              Expanded(
                                child: RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "I agree to the ",
                                        style: TextStyle(
                                          fontFamily:bold,
                                          color: Colors.grey, // Assuming fontGrey is a color or define it explicitly
                                        ),
                                      ),
                                      TextSpan(
                                        text: "Terms and Conditions",
                                        style: TextStyle(
                                          fontFamily:bold,
                                          color: Colors.pinkAccent,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "& Privacy Policy",
                                        style: TextStyle(
                                          fontFamily:bold,
                                          color: Colors.pinkAccent,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]
                        ),
                        5.heightBox,
                        controller.isloading.value? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(pinkAccent),
                        ) : ourButton(color:isCheck==true?pinkAccent:lightGrey,title:signup, textcolor: whiteColor,onPress: ()async{
                          if(isCheck!=false){
                            controller.isloading(true);
                            try {
                              await controller
                                .signupMethod(context: context , email : emailController.text ,password: passwordController.text).then((value){
                                  return controller.storeUserData(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    name: nameController.text,
                                  );
                                }).then((value){
                                  VxToast.show(context, msg: loggedin);
                                  Get.offAll(const Home());
                                });
                            }catch(e){
                              auth.signOut();
                              VxToast.show(context, msg: loggedout);
                              controller.isloading(false);
                            }
                          }
                        }).box.width(context.screenWidth-100).make(),
                        RichText(
                            text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text:"Already have an account?" ,
                                    style: TextStyle(
                                      fontFamily:bold,
                                      color: Colors.grey, // Assuming fontGrey is a color or define it explicitly
                                    ),
                                  ),
                                  TextSpan(
                                    text: "login",
                                    style: TextStyle(
                                      fontFamily:bold,
                                      color: Colors.pinkAccent, // nkAssuming fontGrey is a color or define it explicitly
                                    ),
                                  )
                                ]
                            )

                        ).onTap(() {
                          Get.back();
                        }),
                      ]
                  ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth-70).shadow3xl.make())
                ]
            )
        )
    );
  }



}