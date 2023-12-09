import 'package:my_prj/Const/constants.dart';

Widget featuredButton({String?title,icon}){
  return Row(
    children:[
      Image.asset(icon,width:60,fit:BoxFit.fill),
    20.widthBox,
  title!.text.fontFamily(bold).color(darkFontGrey).make(),

    ]
  ).box.width(350).margin(const EdgeInsets.symmetric(horizontal: 4)).white.padding(const EdgeInsets.all(4)).roundedSM.outerShadowSm.make();
}