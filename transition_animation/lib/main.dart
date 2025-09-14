import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:transition_animation/dashboard.dart';
import 'package:transition_animation/profile.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _router);
  }

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (context, state) => const Dashboard()),
      GoRoute(
        path: "/profile",
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(seconds: 3),
            fullscreenDialog: true,
            key: state.pageKey,
            child: const Profile(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: CurveTween(
                      curve: Curves.easeInOutCirc,
                    ).animate(animation),
                    child: child,
                  );
                },
          );
        },
      ),
    ],
  );
}
