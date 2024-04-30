import 'package:get/get.dart';
import 'package:my_prj/Const/constants.dart';
import 'package:my_prj/controllers/home_controller.dart';

class CartController extends GetxController{
    var totalp=0.obs;

    var addressController=TextEditingController();
    var cityController=TextEditingController();
    var stateController=TextEditingController();
    var postalcodeController=TextEditingController();
    var phoneController=TextEditingController();
    

    var paymentindex=0.obs;

  calculate(data){
    totalp.value=0;
    for(var i=0;i<data.length;i++){
     totalp =totalp+int.parse(data[i]['tprice'].toString());
    }
  }

  changePaymentIndex(index){
    paymentindex.value=index;

  }
//   placeMyOrder(uid)async{
//     await firestore.collection(ordersCollection).doc().set({
//       'order_by':currentUser!.uid,
// 'order_by_name':Get.find<HomeController>().currentUser!.username,
//     });
//   }
}