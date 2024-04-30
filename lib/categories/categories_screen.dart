import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_prj/categories/categories_details.dart';
import 'package:my_prj/controllers/home_controller.dart';
import 'package:my_prj/controllers/product_controller.dart';
import 'package:my_prj/views/home/home_screen.dart';
import 'package:my_prj/widget_common/bg_widget.dart';
import '../Const/constants.dart';
import '../Const/lists.dart';

class CategoriesScreen  extends StatelessWidget{
  const CategoriesScreen ({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller =Get.put(ProductController());
    return Scaffold(
        backgroundColor: lightGrey,
        appBar: AppBar(
           leading: IconButton(onPressed: (){
          Get.to(()=>const HomeScreen());
        }, icon: const Icon(Icons.arrow_back)),
          backgroundColor: pinkAccent,
          title: categories.text.fontFamily(bold).white.make(),
        ),
        body:SingleChildScrollView(

          child: (
          GridView.builder(
                  shrinkWrap: true,
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3, mainAxisSpacing: 8, crossAxisSpacing:8,mainAxisExtent:230), itemBuilder: (context,index){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Image.asset(
                        categoriesImages[index],height:170,width:100, fit:BoxFit.cover,
                      ),
                     categoriesList[index].text.color(pinkAccent).align(TextAlign.center).make()

                    ]
                ).box.white.margin(const EdgeInsets.symmetric(horizontal: 4)).outerShadowSm.clip(Clip.antiAlias).padding(const EdgeInsets.all(8)).make().onTap(() {
                  controller.getCategories(categoriesList[index]);
                  Get.to(()=>CategoryDetails(title:categoriesList[index]),
                  );
                });
              })

          ),
        )

    );}}