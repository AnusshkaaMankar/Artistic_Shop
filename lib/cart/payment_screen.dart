import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_prj/Const/constants.dart';
import 'package:my_prj/Const/lists.dart';
import 'package:my_prj/controllers/cart_controller.dart';
import 'package:my_prj/widget_common/our_button.dart';

class PaymentScreen extends StatelessWidget{
 const PaymentScreen({super.key});
  @override 
  Widget build(BuildContext context){
    var controller=Get.find<CartController>();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title:"Choose Payment Method".text.color(pinkAccent).make()
      ),
      bottomNavigationBar:SizedBox(height: 50,child: ourButton(
      onPress: (){},
      color:pinkAccent,
      textcolor: whiteColor,
      title: "Place My Order"
      )),
      body:Padding(padding: const EdgeInsets.all(15), child:
      Obx(()=>Column(children: List.generate(paymentMethodlist.length, (index){
        return GestureDetector(
          onTap: (){
              controller.changePaymentIndex(index);
          },
         child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              style: BorderStyle.solid,
              color: Vx.black,
            width:2)),
            margin: const EdgeInsets.only(bottom: 8),
          child: Stack(children:[
            Image.asset(paymentMethodlist[index],
            width:double.infinity,
            height:110,
            colorBlendMode: controller.paymentindex.value==index?BlendMode.darken:BlendMode.color,
            fit: BoxFit.cover
            ),
          controller.paymentindex.value==index?  
          Transform.scale(
            scale:1.3 , 
            child:Checkbox(
            activeColor:Colors.green,
            shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50)
            ),
            value: true, 
            onChanged: (value){}),
            )
            :Container()  ,
            paymentMethodlistNames[index].text.align(TextAlign.right).make()
          ])
        ));
      }),)))
    );
  }
}