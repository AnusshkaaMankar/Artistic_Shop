import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:my_prj/Const/auth_controller.dart';
import 'package:my_prj/Const/lists.dart';
import 'package:my_prj/account/components/details_card.dart';
import 'package:my_prj/services/firestore_services.dart';
import 'package:my_prj/views/auth_screen/login_screen.dart';
import 'package:my_prj/account/edit_profile.dart';
import 'package:my_prj/widget_common/profile_controller.dart';

import '../Const/constants.dart';
class AccountScreen extends StatelessWidget{
  const AccountScreen ({Key? key}): super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller=Get.put(profileController());
    return Scaffold(
      body:
      StreamBuilder(
        stream: FireStoreServices.getUser(currentUser!.uid), 
        builder:(BuildContext context , AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return const Center(child:CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(pinkAccent),));
          }else{

          var data=snapshot.data!.docs[0];

          return Container(
        color:whiteColor,
         padding: const EdgeInsets.all(8),
         child:Column(children:[
         const Align( alignment:Alignment.topRight,
         child: Icon(Icons.edit,color:pinkAccent)).onTap(() async{
          Get.to(()=> EditProfile(data: data));
         },),
          Row(children: [
            Image.asset(
              icaccount,
              width:100,
              fit:BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make(),
              10.widthBox,
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "${data['name']}".text.fontFamily(semibold).size(18).color(pinkAccent).make(),
                  5.heightBox,
                  "${data['email']}".text.fontFamily(semibold).color(Colors.black).make(),
                ],
              ))
,              OutlinedButton(style: OutlinedButton.styleFrom(
                side:const BorderSide(
                  color:pinkAccent
                )
              ),
              onPressed:() async{
                await Get.put(AuthController()).signOutMethod(context);
                Get.offAll(()=>const LoginScreen());
              } ,
              child:logout.text.fontFamily(semibold).color(pinkAccent).make()
                    )          ]
            ),
            20.heightBox,
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DetailsCard(count:data['cart_count'], title:"in your cart",width: context.screenWidth/3.4),
              DetailsCard(count:data['wishlist_count'], title:"in your wishlist",width: context.screenWidth/3.4),
              DetailsCard(count:data['order_count'], title:"your Orders",width: context.screenWidth/3.4),
            ],
           ),  

        20.heightBox,
        ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context,index){
            return const Divider(
              color:lightGrey
            );
          },
          itemCount:profileButtonList.length ,
          itemBuilder: (BuildContext context ,int index){
            return ListTile(
              //leading: Image.asset(profileButtonIcon[index]),
              title: profileButtonList[index].text.make(),
            );
          }  ).box.white.rounded.padding(const EdgeInsets.symmetric(horizontal: 16,vertical: 5)).shadowSm.make()     
],),
    
         );
          }
         
        }
      ));
       }
    }