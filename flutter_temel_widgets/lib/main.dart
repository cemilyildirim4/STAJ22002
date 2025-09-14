import 'package:flutter/material.dart';
import 'package:flutter_temel_widgets/dropdown_button_kullanimi.dart';
import 'package:flutter_temel_widgets/image_widgets.dart';
import 'package:flutter_temel_widgets/my_counter_page.dart';
import 'package:flutter_temel_widgets/popupmenu_kullanimi.dart';
import 'package:flutter_temel_widgets/temel_button_turleri.dart';

void main() {
  debugPrint("Main metodu çalıştı");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    debugPrint("MyApp Build çalıştı");
    return MaterialApp(
      title: 'My Counter App',
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.teal,
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Image Örnekleri"),
          actions: [PopupmenuKullanimi()],
        ),
        body: PopupmenuKullanimi(),
      ),
    );
  }
}
