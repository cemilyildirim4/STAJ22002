import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_vs_push/route_names.dart';

class PageA extends StatelessWidget {
  const PageA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("page A")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.pushNamed(RouteNames.routeB);
          },
          child: Text("Go page B"),
        ),
      ),
    );
  }
}
