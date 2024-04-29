import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:my_prj/controllers/product_controller.dart';
import 'package:my_prj/widget_common/our_button.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Const/constants.dart';
import '../Const/lists.dart';

class ItemDetails extends StatelessWidget {
  final String? title;

  const ItemDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller=Get.find<ProductController>();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: title!.text.white.fontFamily(bold).make(),
        backgroundColor: pinkAccent,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_outline))
        ],
      ),
      body: Column(
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
                      itemCount: 3,
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
                      onRatingUpdate: (value) {},
                      normalColor: textfieldGrey,
                      selectionColor: golden,
                      count: 5,
                      size: 25,
                      stepInt: true,
                    ),
                    10.heightBox,
                    "\$30,000".text.color(pinkAccent).fontFamily(bold).size(18).make(),
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
                          Obx(() =>    Row(
                                children: [
                                  IconButton(onPressed: () {
                                    controller.decreaseQuantity();
                                  }, icon: const Icon(Icons.remove)),
                                  "${controller.quantity.value}".text.size(16).color(darkFontGrey).fontFamily(bold).make(),
                                  IconButton(onPressed: () {
                                    controller.increaseQuantity();
                                  }, icon: const Icon(Icons.add)),
                                ],
                              )),
                            ],
                          ).box.padding(const EdgeInsets.all(8)).color(Colors.white).shadowSm.make(),
                        ),
                      ],
                    ),
                    10.heightBox,
                    "Description:".text.color(pinkAccent).fontFamily(semibold).make(),
                    10.heightBox,
                    "Wooden light weight".text.color(pinkAccent).make(),
                                            const Divider(color: lightGrey),
                        ...itemdetailsbuttonlist.map((buttonText) => ListTile(title: buttonText.text.make())).toList(),
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
            child: ourButton(color: pinkAccent, onPress: () {}, textcolor: whiteColor, title: "Add to Cart"),
          )
        ],
      ),
    );
  }
}