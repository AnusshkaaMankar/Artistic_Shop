import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:my_prj/views/home/home_screen.dart';

import '../../Const/constants.dart';
import '../../account/account_screen.dart';
import '../../cart/cart_screen.dart';
import '../../categories/categories_screen.dart';
import '../../controllers/home_controller.dart';
import 'home_screen.dart';

class Home extends StatelessWidget{
  const Home ({super.key});

  @override
  Widget build(BuildContext context) {
    var controller= Get.put(HomeController());// The value of the local variable 'cor

    var navbarItem=[

    BottomNavigationBarItem(icon: Image.asset(ichome, width: 25), label: home),
    BottomNavigationBarItem(icon: Image.asset(iccategories, width: 25), label: categories),
    BottomNavigationBarItem(icon: Image.asset(iccart, width: 25), label: cart),
    BottomNavigationBarItem(icon: Image.asset(icaccount, width: 25), label: account),
];
    var navbody =[
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    const AccountScreen(),
    ];
    return Scaffold(
    body:Column(
      children:[
        Obx(()=>Expanded(child:navbody.elementAt(controller.currentNavIndex.value)))
      ],
    ),
        bottomNavigationBar: Obx(
              () => BottomNavigationBar(

            currentIndex: controller.currentNavIndex.value,
                selectedItemColor: Colors.pinkAccent,
                selectedLabelStyle: const TextStyle(fontFamily: semibold),
                type: BottomNavigationBarType.fixed,
                backgroundColor: whiteColor,
                items: navbarItem,
                onTap: (value) {
                  controller.currentNavIndex.value = value;
                },

              ), // Obx
    )// Scaffold
    );
  }
}



