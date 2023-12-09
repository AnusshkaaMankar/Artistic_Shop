import 'package:flutter/cupertino.dart';
import 'package:my_prj/Const/constants.dart';

Widget bgWidget({Widget? child}){
 return Container(
  decoration: const BoxDecoration(image:DecorationImage(image:AssetImage(imgBackground),fit:BoxFit.cover)),
 );
}