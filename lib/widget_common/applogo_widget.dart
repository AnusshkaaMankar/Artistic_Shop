import 'package:flutter/material.dart';
import 'package:my_prj/Const/constants.dart';

Widget applogoWidget() {
//using velpoity X here
  return Image
      .asset(icapplogo)
      .box
      .white
      .size(100, 100)
      .padding(const EdgeInsets.all(8))
      .rounded.shadow3xl
      .make();
}
