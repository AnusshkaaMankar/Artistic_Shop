import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_prj/Const/auth_controller.dart';
import 'package:my_prj/Const/lists.dart';
import 'package:my_prj/account/components/details_card.dart';
import 'package:my_prj/services/firestore_services.dart';
import 'package:my_prj/views/auth_screen/login_screen.dart';
import 'package:my_prj/account/edit_profile.dart';
import 'package:my_prj/widget_common/profile_controller.dart';

import '../Const/constants.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return Scaffold(
      body: StreamBuilder(
        stream: FireStoreServices.getUser(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(pinkAccent)));
          } else {
            var data = snapshot.data!.docs[0];
            return Scaffold(
              backgroundColor: whiteColor,
              body: ListView(
                children: [
                  SizedBox(height: MediaQuery.of(context).padding.top),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Align(
                          alignment: Alignment.topRight,
                          child: Icon(Icons.edit, color: pinkAccent),
                        ).onTap(() async {
                          controller.nameController.text = data['name'];
                          controller.nameController.text = data['password'];

                          Get.to(() => EditProfile(data: data));
                        }),
                        Row(
                          children: [
                            Image.asset(
                              icaccount,
                              width: 100,
                              fit: BoxFit.cover,
                            ).box.roundedFull.clip(Clip.antiAlias).make(),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "${data['name']}".text.fontFamily(semibold).size(18).color(pinkAccent).make(),
                                  const SizedBox(height: 5),
                                  "${data['email']}".text.fontFamily(semibold).color(Colors.black).make(),
                                ],
                              ),
                            ),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: pinkAccent),
                              ),
                              onPressed: () async {
                                await Get.put(AuthController()).signOutMethod(context);
                                Get.offAll(() => const LoginScreen());
                              },
                              child: Text('Logout', style: TextStyle(fontFamily: semibold, color: pinkAccent)),
                            ),
                          ],
                        ),
                        20.heightBox,
                        SingleChildScrollView(child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(child: DetailsCard(count: 'cart_count', title: "in your cart", width: context.screenWidth /4)),
                            Expanded(child: DetailsCard(count: 'wishlist_count', title: "in your wishlist", width: context.screenWidth /4)),
                            Expanded(child: DetailsCard(count: 'orders_count', title: "your Orders", width: context.screenWidth / 4)),
                          ],
                        )),
                        const SizedBox(height: 20),
                        const Divider(color: lightGrey),
                        ...profileButtonList.map((buttonText) => ListTile(title: buttonText.text.make())).toList(),
                      ],
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
