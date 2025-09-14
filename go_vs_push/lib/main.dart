import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_vs_push/page_A.dart';
import 'package:go_vs_push/page_B.dart';
import 'package:go_vs_push/page_C.dart';
import 'package:go_vs_push/route_names.dart';

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
      GoRoute(
        name: RouteNames.routeA,
        path: "/",
        builder: (context, state) => const PageA(),
        routes: [
          GoRoute(
            name: RouteNames.routeB,
            path: "pageB",
            builder: (context, state) => const PageB(),
          ),
          GoRoute(
            name: RouteNames.routeC,
            path: "pageC",
            builder: (context, state) => const PageC(),
          ),
        ],
      ),
    ],
  );
}
