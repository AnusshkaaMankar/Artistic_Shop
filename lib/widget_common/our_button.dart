import 'package:my_prj/Const/constants.dart';

Widget ourButton({onPress,color,textcolor,String? title}){
  return ElevatedButton(
      style:ElevatedButton.styleFrom(
        primary: Colors.pink,
        padding: const EdgeInsets.all(12),
      ),
      onPressed:
        onPress
      , child: title!.text.white.fontFamily(bold).make());
}