import 'package:flutter/material.dart';
import 'package:flutter_inputs/sayac_state.dart';

class GlobalKeyKullanimi extends StatelessWidget {
  GlobalKeyKullanimi({super.key});
  final sayacWidgetKey = GlobalKey<SayacWidgetState>();

  @override
  Widget build(BuildContext context) {
    print("1");
    return Scaffold(
      appBar: AppBar(title: Text("Global Key Kullanımı")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Butona basılma miktarı"),
            SayacWidget(key: sayacWidgetKey),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          sayacWidgetKey.currentState!.artir();
        },
      ),
    );
  }
}
