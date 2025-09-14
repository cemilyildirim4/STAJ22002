import 'package:flutter/material.dart';

class ListviewLayoutProblemleri extends StatelessWidget {
  const ListviewLayoutProblemleri({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listview Layout Problems"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        height: 200,
        child: Row(
          children: [
            Expanded(
              child: ListView(
                reverse: true,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  Text("başladı"),
                  Container(width: 200, color: Colors.orange.shade200),
                  Container(width: 200, color: Colors.orange.shade400),
                  Container(width: 200, color: Colors.orange.shade600),
                  Container(width: 200, color: Colors.orange.shade800),
                  Container(width: 200, color: Colors.orange.shade100),
                  Container(width: 200, color: Colors.orange.shade200),
                  Container(width: 200, color: Colors.orange.shade400),
                  Container(width: 200, color: Colors.orange.shade600),
                  Container(width: 200, color: Colors.orange.shade800),
                  Container(width: 200, color: Colors.orange.shade100),
                  Text("Bitti"),
                ],
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          border: Border.all(width: 4, color: Colors.red),
        ),
      ),
    );
  }

  Column colunIcindeListe() {
    return Column(
      children: [
        Text("Başladı"),
        Expanded(
          child: ListView(
            /* shrinkWrap: true, */
            children: [
              Container(height: 200, color: Colors.orange.shade200),
              Container(height: 200, color: Colors.orange.shade400),
              Container(height: 200, color: Colors.orange.shade600),
              Container(height: 200, color: Colors.orange.shade800),
              Container(height: 200, color: Colors.orange.shade100),
            ],
          ),
        ),
        Text("Bitti"),
      ],
    );
  }
}
