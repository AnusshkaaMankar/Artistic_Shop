import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:my_prj/Const/constants.dart';

class AuthController extends GetxController{
  Future<UserCredential?> loginMethod({email, password , context}) async{
    UserCredential? userCredential;

    try{
      userCredential=await auth.signInWithEmailAndPassword(email:email, password:password);
    }on FirebaseAuthException  catch(e) {
      VxToast.show(context , msg:e.toString());
    }
    return userCredential;
  }
  Future<UserCredential?> signupMethod({email, password , context}) async{
    UserCredential? userCredential;

    try{
      userCredential=await auth.createUserWithEmailAndPassword(email:email, password:password);
    }on FirebaseAuthException  catch(e) {
      VxToast.show(context , msg:e.toString());
    }
    return userCredential;
  }
  signOutMethod(context) async{
    try{
      await auth.signOut();
    }
    catch(e){
      VxToast.show(context , msg:e.toString());
    }
  }
  storeUserData({name,password,email}) async{
    DocumentReference store= firestore.collection(userColletion).doc(currentUser!.uid);
    store.set({'name':Name ,'password':password ,'email':email,'imageUrl':''});
  }
}