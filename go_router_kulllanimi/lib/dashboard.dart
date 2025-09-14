import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_kulllanimi/route_name.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //GoRouter.of(context).go("/profile");
            /* String name = "Cemil";
            context.go("/profile/$name"); */
            final bilgiMap = {"yas": "22", "boy": "177", "meslek": "yazılım"};
            context.goNamed(
              RouteName.profile,
              queryParameters: {
                "name": "Cemil",
                "surname": "Yıldırım",
                "bilgi": jsonEncode(bilgiMap),
              },
            );
          },
          child: const Text("Profile"),
        ),
      ),
    );
  }
}
