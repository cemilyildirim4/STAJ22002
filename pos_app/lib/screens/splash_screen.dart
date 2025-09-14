import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pos_app/router/route_name.dart';
import 'package:pos_app/screens/on_boarding_screen/multi_step_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      context.replaceNamed(RouteName.multi_step_screen_name);
    });
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,

          color: Color(0xFF021239),
          child: Image.asset(
            "assets/images/splash_screen.png",
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
