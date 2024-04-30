import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:my_prj/Const/colors.dart';
import 'package:my_prj/Const/images.dart';
import 'package:my_prj/Const/styles.dart';
import 'package:my_prj/cart/cart_screen.dart';
import 'package:my_prj/controllers/product_controller.dart';
import 'package:my_prj/services/firestore_services.dart';
import 'package:my_prj/services/loadingIndicator.dart';
import 'package:my_prj/widget_common/our_button.dart';
import 'package:velocity_x/velocity_x.dart';
import '../Const/constants.dart';
import '../Const/lists.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
    final dynamic data;

  const ItemDetails({Key? key, required this.title,this.data}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var controller=Get.find<ProductController>();
    return WillPopScope( onWillPop: ()async{
      controller.resetvalues();
      return true;
    },
    child:Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          controller.resetvalues();
          Get.back();
        }, icon: const Icon(Icons.arrow_back)),
        title: title!.text.white.fontFamily(bold).make(),
        backgroundColor: pinkAccent,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          Obx(()=>IconButton(onPressed: () {
            if(controller.isFav.value){
              controller.removefromWishList(context,data.id);
              controller.isFav(false);
            }else{
              controller.addtoWishList(context,data.id);
              controller.isFav(true);
            }
          }, icon: Icon(
    Icons.favorite_outline,
    color: controller.isFav.value ? whiteColor : darkFontGrey,
  )))
        ],
      ),
      body:Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VxSwiper.builder(
                      autoPlay: true,
                      height: 350,
                      itemCount:3,
                      viewportFraction: 1.0,
                      aspectRatio: 16 / 9,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          basketSlider[index],
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                    10.heightBox,
                    title!.text.size(16).color(darkFontGrey).fontFamily(semibold).make(),
                    VxRating(
                      isSelectable: false,
                      value:double.parse(data['p1_rating']),
                      onRatingUpdate: (value) {},
                      normalColor: textfieldGrey,
                      selectionColor: golden,
                      count: 5,
                      maxRating: 5,
                      size: 25,
                    ),
                    10.heightBox,
                    "${data['p1_price']}".numCurrency.text.color(pinkAccent).fontFamily(bold).size(18).make(),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Seller".text.pink900.fontFamily(semibold).make(),
                              5.heightBox,
                              "In House Brands".text.fontFamily(semibold).color(darkFontGrey).size(16).make(),
                            ],
                          ).box.height(60).padding(const EdgeInsets.symmetric(horizontal: 16)).color(textfieldGrey).make(),
                        ),
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.message_rounded, color: darkFontGrey),
                        ),
                        20.widthBox,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Quantity:".text.color(pinkAccent).make(),
                             Obx(()=>Row(
                                children: [
                                  IconButton(onPressed: () {
                                    controller.decreaseQuantity();
                                    controller.calculateTotalPrice(data['p1_price']);
                                  }, icon: const Icon(Icons.remove)),
                                  "${controller.quantity.value}".text.size(16).color(darkFontGrey).fontFamily(bold).make(),
                                  IconButton(onPressed: () {
                                    controller.increaseQuantity();
                                    controller.calculateTotalPrice(data['p1_price']);
                                  }, icon: const Icon(Icons.add)),
                                ],
                              ),
                             )
                            ],
                          ).box.padding(const EdgeInsets.all(8)).color(Colors.white).shadowSm.make(),
                        ),
                      ],
                    ),
                    Obx(()=>Row(children: [
                      SizedBox(
                        width:100,
                        child: "Total : ".text.size(20).color(pinkAccent).make(),
                      ),
                      "Rs.${controller.totalPrice.value}".text.size(20).fontFamily(bold).color(Vx.green500).make()
        
                    ],).box.padding(const EdgeInsets.all(8)).color(whiteColor).shadow.make(),),
                    10.heightBox,
                    "Description:".text.size(20).color(pinkAccent).fontFamily(semibold).make(),
                    10.heightBox,
                    "Wooden".text.size(16).color(darkFontGrey).make(),
                    "light weight".text.size(16).color(darkFontGrey).make(),

                            const Divider(color: lightGrey),
                        ...itemdetailsbuttonlist.map((buttonText) => ListTile(title: buttonText.text.color(Vx.black).make())).toList(),
                    // ListView(
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   children:List.generate(
                    //     itemdetailsbuttonlist.length, (index) => ListTile(
                    //     title:itemdetailsbuttonlist[index].text.fontFamily(semibold).color(pinkAccent).make(),
                    //     trailing: const Icon(Icons.arrow_forward),
                    //   )),
                    // )

                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ourButton(color: pinkAccent, onPress: () {
              controller.addToCart(
                context: context,
                img:imgBucket1,
                qty: controller.quantity.value,
                sellername: data['p1_seller'],
                title: data['p1_name'],
                tprice:controller.totalPrice.value);
                Get.to(()=>const CartScreen());
            }, textcolor: whiteColor, title: "Add to Cart"),
          )
        ],
      )
    )
    );
  }
}