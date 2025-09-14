import 'package:flutter/material.dart';

class PurplePage extends StatelessWidget {
  const PurplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Purple Page"),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Center(child: Text("Orange Page", style: TextStyle(fontSize: 24))),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/orangePage', arguments: 80);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange.shade600,
            ),
            child: Text(
              "Orange Page git",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
