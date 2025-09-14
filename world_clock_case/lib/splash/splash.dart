import 'package:flutter/material.dart';
import 'package:world_clock_case/colors/colors.dart';
import 'package:world_clock_case/home_page_screen/home_page_view.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 2 saniye sonra ana sayfaya geç
    Future.delayed(const Duration(seconds: 2),
     () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 1000),
          pageBuilder: (_, __, ___) => const HomePageScreen(),
          transitionsBuilder: (_, animation, __, child) {
            const begin = Offset(1.0, 0.0); // sağdan başla
            const end = Offset.zero;
            final tween = Tween(
              begin: begin,
              end: end,
            ).chain(CurveTween(curve: Curves.easeInOut));
            final offsetAnimation = animation.drive(tween);

            return SlideTransition(position: offsetAnimation, child: child);
          },
        ),
      );
    });

    return Scaffold(
      backgroundColor: AppColors.dark,
      body: Center(child: Image.asset("assets/pngs/Dop-plaka.png")),
    );
  }
}
