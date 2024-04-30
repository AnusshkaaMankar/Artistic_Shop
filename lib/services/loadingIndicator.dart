import 'package:my_prj/Const/constants.dart';

Widget loadIndicator(){
  return const CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(pinkAccent),
  );
}