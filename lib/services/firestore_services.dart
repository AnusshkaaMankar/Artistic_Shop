import 'package:get/get.dart';
import 'package:my_prj/Const/constants.dart';

class FireStoreServices{
  static getUser(uid){
    return firestore.collection(userColletion).where('id',isEqualTo: uid).snapshots();
  }

  static getProducts(category){
    return firestore.collection(productCollection).where('p1_category',isEqualTo: category).snapshots();
  }
  static getCart(uid){
    return firestore.collection(cartCollection).where('added_by', isEqualTo: uid).snapshots();
  }
  //
  static deleteDocument(docId){
return firestore.collection(cartCollection).doc(docId).delete();
  }
}