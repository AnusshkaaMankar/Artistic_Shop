import 'package:flutter/cupertino.dart';
import 'package:my_prj/Const/constants.dart';

Widget DetailsCard({width , String? title , String? count }){
  return Column(
              children: [
                "00".text.fontFamily(semibold).size(18).white.make(),
                5.heightBox,
                "In your Cart".text.fontFamily(semibold).size(18).white.make(),
              ],
            ).box.color(pinkAccent).rounded.width(width).height(60).padding(const EdgeInsets.all(4)).make();
}

