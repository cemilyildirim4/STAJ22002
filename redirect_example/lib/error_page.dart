import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Error")),
      body: const Center(
        child: Text("This is a Error Page", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
