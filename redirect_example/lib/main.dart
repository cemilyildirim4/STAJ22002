import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:redirect_example/dashboard.dart';
import 'package:redirect_example/error_page.dart';
import 'package:redirect_example/login.dart';

void main(List<String> args) {
  runApp(MyApp());
}

final isLoggIn = true;

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: "Go Router", routerConfig: _router);
  }

  final GoRouter _router = GoRouter(
    errorBuilder: (context, state) => const ErrorPage(),
    redirect: (context, state) {
      if (isLoggIn) {
        return "/test";
      } else {
        return "/";
      }
    },
    routes: [
      GoRoute(path: "/", builder: (context, state) => const Login()),
      GoRoute(
        path: "/dashboard",
        builder: (context, state) => const Dashboard(),
      ),
    ],
  );
}
