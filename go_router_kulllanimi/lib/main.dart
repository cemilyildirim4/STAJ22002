import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_kulllanimi/dashboard.dart';
import 'package:go_router_kulllanimi/profile.dart';
import 'package:go_router_kulllanimi/route_name.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: "Go Router", routerConfig: _router);
  }

  final GoRouter _router = GoRouter(  
    routes: [
      GoRoute(
        name: RouteName.dashboard,
        path: "/",
        builder: (context, state) => const Dashboard(),
        routes: [
          GoRoute(
            name: RouteName.profile,
            path: "profile",
            builder: (context, state) => Profile(
              name: state.uri.queryParameters["name"]!,
              surname: state.uri.queryParameters["surname"]!,
              bilgi: jsonDecode(state.uri.queryParameters["bilgi"]!),
            ),
          ),
        ],
      ),
    ],
  );
}
