import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetDeneme extends StatelessWidget {
  var count = 0.obs;
  @override
  Widget build(context) => Scaffold(
    appBar: AppBar(title: Text("counter")),
    body: Center(child: Obx(() => Text("$count"))),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => count++,
    ),
  );
}
