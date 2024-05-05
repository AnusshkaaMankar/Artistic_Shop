import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_prj/cart/shipping_screen.dart';
import 'package:my_prj/categories/categories_screen.dart';
import 'package:my_prj/controllers/cart_controller.dart';
import 'package:my_prj/services/firestore_services.dart';
import 'package:my_prj/services/loadingIndicator.dart';
import 'package:my_prj/widget_common/our_button.dart';

import '../Const/constants.dart';

class CartScreen extends StatelessWidget{
  const CartScreen ({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller=Get.put(CartController());
    return Scaffold(
      backgroundColor: whiteColor,
      appBar:
        AppBar(
          leading: IconButton(onPressed: (){
          Get.to(()=>const CategoriesScreen());
        }, icon: const Icon(Icons.arrow_back)),
          automaticallyImplyLeading: false,
          backgroundColor: pinkAccent,
          title: 'Shopping Cart'
          .text
          .fontFamily(bold)
          .color(whiteColor)
          .make(),

      ),
      bottomNavigationBar:SizedBox(
        height: 50,
        child: ourButton(
              color:pinkAccent,
              onPress: (){
                Get.to(()=>const ShippingScreen());
              },
              textcolor: whiteColor,
              title: "Proceed to Shipping",

            )),
      body: StreamBuilder(stream: FireStoreServices.getCart(currentUser!.uid)
      , builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(!snapshot.hasData){
          return Center(child:loadIndicator());
        }else if(snapshot.data!.docs.isEmpty){
          return Center(child:"Cart is Empty".text.color(darkFontGrey).make() );
        }else{
          var data=snapshot.data!.docs;
          controller.calculate(data);
          return   Padding(padding: const EdgeInsets.all(8.0),
      child:Column(
        children: [
          Expanded(child:Container(
            color:whiteColor,
            child:ListView.builder(
  itemCount: data.length,
  itemBuilder: (BuildContext context, int index) {
    return ListTile(
      leading: Image.network(data[index]["img"]),
      title: "${data[index]['title']} (x${data[index]['qty']})".text.fontFamily(semibold).size(16).make(),
      subtitle: "Rs.${data[index]['tprice']}".text.color(pinkAccent).fontFamily(semibold).make(),
      trailing: const Icon(Icons.delete,
      color: pinkAccent,).onTap(() { 
        FireStoreServices.deleteDocument(data[index].id);
      })
    );
  },
)
)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "Total Price".text.size(20).fontFamily(semibold).color(Vx.black).shadowColor(Vx.pink400).make(),
              Obx(()=>"Rs.${controller.totalp.value}".text.size(20).fontFamily(semibold).color(whiteColor).make(),)
            ],
          ).box.padding(const EdgeInsets.all(12)).color(golden).width(context.screenWidth-60).make(),
          10.heightBox,
          SizedBox(
            width:context.screenWidth-60,
            )
        ],
      )
      ) ;
        }
      }
      ));}}

