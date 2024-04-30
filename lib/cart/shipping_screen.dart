import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_prj/Const/colors.dart';
import 'package:my_prj/Const/constants.dart';
import 'package:my_prj/cart/payment_screen.dart';
import 'package:my_prj/controllers/cart_controller.dart';
import 'package:my_prj/widget_common/custom_textfield.dart';
import 'package:my_prj/widget_common/our_button.dart';

class ShippingScreen extends StatefulWidget{
 const ShippingScreen({super.key});
 @override
   State<StatefulWidget> createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen>{
    bool? isCheck=false ;

  @override
 Widget build(BuildContext context){
  var controller=Get.find<CartController>();
  return Scaffold(
    backgroundColor: whiteColor,
    appBar: AppBar(
      leading: IconButton(onPressed: (){
          Get.back();
        }, icon: const Icon(Icons.arrow_back)),
      automaticallyImplyLeading: false,
      title: "Shipping Info".text.color(pinkAccent).fontFamily(semibold).make(),
    ),
    bottomNavigationBar:  SizedBox(
      height: 50,
      child:ourButton(
      onPress: (){
        if(controller.addressController.text.length>10){
          Get.to(()=>const PaymentScreen());
        }else{
          VxToast.show(context,msg:"Please Fill the Form");
        }
      },
      color:pinkAccent,
      textcolor: whiteColor,
      title: "Continue",
    )
    ),
    body:Padding(padding: const EdgeInsets.all(12),
    child:Column(children: [
      customTextField( hint:"Address", title:"Address",   ispass: false, controller: controller.addressController),
      customTextField( hint:"City", title:"City",   ispass: false , controller: controller.cityController),
      customTextField( hint:"State", title:"State",   ispass: false , controller: controller.stateController),
      customTextField( hint:"Postal Code", title:"Postal Code",   ispass: false , controller: controller.postalcodeController),
      customTextField( hint:"Phone", title:"Phone",   ispass: false , controller: controller.phoneController),
      10.heightBox,
      Row(children:[ Checkbox(
                                activeColor:pinkAccent,
                                checkColor:pinkAccent,
                                value:isCheck,
                                onChanged: (newValue){
                                  setState(() {
                                    isCheck=newValue;
                                  });
                                },
                              ),
                    "Use Saved address".text.color(Vx.black).size(16).make()
                              ]),    
      "VIIT College, Pune , Maharashtra, 411048,9960003952".text.make()

    ],))
    
  

  );
 } 
}
