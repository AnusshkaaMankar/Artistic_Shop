import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_prj/Const/constants.dart';
import 'package:my_prj/Const/lists.dart';
import 'package:my_prj/categories/item_details.dart';
import 'package:my_prj/controllers/product_controller.dart';
import 'package:my_prj/services/firestore_services.dart';
import 'package:my_prj/services/loadingIndicator.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({Key? key, required this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller=Get.find<ProductController>();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: pinkAccent,
        title: 'Products'.text.fontFamily(bold).color(whiteColor).make(),
      ),
      body: StreamBuilder(
        stream: FireStoreServices.getProducts(title),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: loadIndicator());
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: "No Products found!".text.color(pinkAccent).make(),
            );
          } else {
            var data = snapshot.data!.docs;
            return Container(
              color: whiteColor,
              child: Column(
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        controller.cat.length,
                        (index) => "${controller.cat[index].name}"
                            .text
                            .size(12)
                            .fontFamily(bold)
                            .color(darkFontGrey)
                            .makeCentered()
                            .box
                            .white
                            .rounded
                            .size(120, 60)
                            .margin(const EdgeInsets.symmetric(horizontal: 4))
                            .make(),
                      ),
                    ),
                  ),
                  10.heightBox,
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: lightGrey,
                      child: GridView.builder(
                        itemCount: data.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 0.0,
                          crossAxisSpacing: 0.0,
                        ),
                        itemBuilder: (context, index) {
                          var item = data[index];
                          return GestureDetector(
                            onTap: () {
                              controller.checkIfFav(data[index]);
                              Get.to(() => ItemDetails(title: "${data[index]['p1_name']}",data:data[index]));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    imgBucket1,
                                    height: 110,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                      "$data[index]['p1_category']",
                                      style: const TextStyle(
                                        fontFamily: semibold,
                                        color: darkFontGrey,
                                      ),
                                    ),

                                  const SizedBox(height: 5),
                                  Text(
                                    "$data['p1_price']",
                                    style: const TextStyle(
                                      fontFamily: bold,
                                      color: Colors.pinkAccent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}