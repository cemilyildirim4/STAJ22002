import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_vs_push/route_names.dart';

class PageB extends StatelessWidget {
  const PageB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("page B")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.pushNamed(RouteNames.routeC);
          },
          child: Text("Go page C"),
        ),
      ),
    );
  }
}
