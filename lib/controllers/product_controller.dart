import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:my_prj/models/category_model.dart';

class ProductController extends GetxController{
  var quantity = 0.obs;
  var subcat=[];

getSubCategories(title) async{
  subcat.clear();
  var data=rootBundle.loadString("lib/services/category_model.json");
  var decoded=categoryModelFromJson(data as String);
  var s=decoded.categories.where((element)=> element.name==title).toList();

  for(var e in s[0].subCategory){
    subcat.add(e);

  }
  }
 void increaseQuantity(){
  quantity.value++;
}
void decreaseQuantity(){
  if(quantity.value>0){
      quantity.value--;
  }
}
}
