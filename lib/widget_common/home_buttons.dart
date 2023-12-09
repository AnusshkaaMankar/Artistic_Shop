import '../Const/constants.dart';

Widget homeButtons({width, height, icon, String? title, onPress}) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(icon, width: 70),
        5.heightBox,
        title!.text.fontFamily(semibold).color(darkFontGrey).make()
      ]
  ).box.rounded.gray50.size(width, height).shadowSm.make();
}