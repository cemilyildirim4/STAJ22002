import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:world_clock_case/auth.dart';
import 'package:world_clock_case/home_page_screen/home_page_view.dart';
import 'package:world_clock_case/splash/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'splash/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Auth());
  }
}
