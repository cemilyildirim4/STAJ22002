import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pos_app/card_details.dart';
import 'package:pos_app/router/route_name.dart';
import 'package:pos_app/screens/login_screen/login_screen.dart';
import 'package:pos_app/screens/on_boarding_screen/multi_step_screen.dart';
import 'package:pos_app/otp_screen/otp_screen.dart';
import 'package:pos_app/screens/signup_screen/signup_screen.dart';
import 'package:pos_app/screens/splash_screen.dart';

class RouterPage extends StatelessWidget {
  RouterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const SplashScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1, 0);
                  const end = Offset(0, 0);
                  final tween = Tween(
                    begin: begin,
                    end: end,
                  ).chain(CurveTween(curve: Curves.easeInOut));
                  final offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
          );
        },
      ),
      GoRoute(
        name: RouteName.multi_step_screen_name,
        path: "/multi_step_screen",
        builder: (context, state) => Builderscreen(),
      ),
      GoRoute(
        name: RouteName.login_screen,
        path: "/login_screen",
        pageBuilder: (context, state) => CustomTransitionPage(
          child: LoginScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset(0, 0);
            final tween = Tween(
              begin: begin,
              end: end,
            ).chain(CurveTween(curve: Curves.easeInOut));
            final offsetAnimation = animation.drive(tween);
            return SlideTransition(position: offsetAnimation, child: child);
          },
        ),
      ),
      GoRoute(
        name: RouteName.signup_screen,
        path: "/signup_screen",
        pageBuilder: (context, state) => CustomTransitionPage(
          child: SignupScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset(0, 0);
            final tween = Tween(
              begin: begin,
              end: end,
            ).chain(CurveTween(curve: Curves.easeInOut));
            final offsetAnimation = animation.drive(tween);
            return SlideTransition(position: offsetAnimation, child: child);
          },
        ),
      ),
      GoRoute(
        name: RouteName.otp_screen,
        path: "/virification_screen",
        pageBuilder: (context, state) {
          final extra = state.extra as Map;

          return CustomTransitionPage(
            child: OtpScreen(gelenBilgi: extra),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset(0, 0);
                  final tween = Tween(
                    begin: begin,
                    end: end,
                  ).chain(CurveTween(curve: Curves.easeInOut));
                  final offsetAnimation = animation.drive(tween);
                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
          );
        },
      ),
      GoRoute(
        name: RouteName.card_details_screen,
        path: "/card_details_screen",
        pageBuilder: (context, state) => CustomTransitionPage(
          child: CardDetails(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset(0, 0);
            final tween = Tween(
              begin: begin,
              end: end,
            ).chain(CurveTween(curve: Curves.easeInOut));
            final offsetAnimation = animation.drive(tween);
            return SlideTransition(position: offsetAnimation, child: child);
          },
        ),
      ),
    ],
  );
}
