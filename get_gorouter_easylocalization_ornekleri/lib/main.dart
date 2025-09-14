import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_gorouter_easylocalization_ornekleri/get.dart';
import 'package:get_gorouter_easylocalization_ornekleri/go_Router.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /* return GetMaterialApp(debugShowCheckedModeBanner: false, home: GetDeneme()); */
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
  