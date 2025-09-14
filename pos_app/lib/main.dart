import 'package:email_otp/email_otp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:pos_app/firebase_options.dart';
import 'package:pos_app/router/router_page.dart';
import 'package:pos_app/screens/on_boarding_screen/on_boarding_controller.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  EmailOTP.config(otpLength: 4, emailTheme: EmailTheme.v1);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /* Get.put(CounterController());*/
    return MaterialApp.router(routerConfig: RouterPage.router);
  }
}
