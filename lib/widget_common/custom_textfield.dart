import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_prj/Const/constants.dart';

Widget customTextField({String? title , String? hint, controller, required bool ispass}) {
return Column (
    crossAxisAlignment: CrossAxisAlignment.start,
children:[
    title!.text.color(Colors.pinkAccent).fontFamily(semibold).size(16).make(),
    5.heightBox,
    TextFormField(
      controller: controller,
      decoration: InputDecoration(
      hintStyle: const TextStyle(
      fontFamily: semibold,
      color: whiteColor,
  ),
      hintText: hint,
      isDense: true,
      fillColor: textfieldGrey,
      filled: true,
      border: InputBorder.none,
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.pinkAccent) ), // Textformfield

      )
      ),
  5.heightBox,
  ]
  );
}
