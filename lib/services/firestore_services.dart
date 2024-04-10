import 'package:get/get.dart';
import 'package:my_prj/Const/constants.dart';

class FireStoreServices{
  static getUser(uid){
    return firestore.collection(userColletion).where('id',isEqualTo: uid).snapshots();
  }
}