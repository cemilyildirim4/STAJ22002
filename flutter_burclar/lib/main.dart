import 'package:flutter/material.dart';
import 'package:flutter_burclar/burc_listesi.dart';
import 'package:flutter_burclar/route_generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink, useMaterial3: false),
      onGenerateRoute: RouteGenerator.routeGenerator,
    );
  }
}
