import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_prj/Const/lists.dart';
import '../Const/constants.dart';
import '../widget_common/bg_widget.dart';
import 'item_details.dart';


class CategoryDetails extends StatelessWidget {
  final String? title;

  const CategoryDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pinkAccent,
        title: baskets.text.fontFamily(bold).color(whiteColor).make(),
      ),
      body: Container(
  color: whiteColor,
  //padding: EdgeInsets.all(12),
  child: Column(
    children: [
      SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            6,
            (index) => "cotton"
                .text
                .size(12)
                .fontFamily(bold) 
                .color(darkFontGrey)
                .makeCentered()
                .box
                .white
                .rounded
                .size(120, 60)
                .margin(EdgeInsets.symmetric(horizontal: 4))
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
           // shrinkWrap: true,
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 0.0, // Adjust the spacing vertically
              crossAxisSpacing: 0.0, // Adjust the spascing horizontally
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(() => ItemDetails(title: "Wooden Basket"));
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
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        categoriesImages[index],
                        height: 110,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Wall Hanger",
                        style: TextStyle(
                          fontFamily: semibold,
                          color: darkFontGrey,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "\$5",
                        style: TextStyle(
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
),

    );
  }
}
