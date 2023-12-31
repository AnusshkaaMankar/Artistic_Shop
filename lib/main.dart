import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:my_prj/Const/constants.dart';
import 'package:my_prj/views/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      debugShowCheckedModeBanner:false ,
      title: 'Artistic Shop',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(0, 146, 55, 55),
        appBarTheme: const AppBarTheme(/*
          iconTheme: IconThemeData(
            color: lightGrey
          ),*/
            backgroundColor: Colors.transparent),
        fontFamily: regular
      ),
      home:const SplashScreen(),
    );
  }
}
