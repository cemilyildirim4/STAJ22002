import 'package:flutter/material.dart';
import 'package:flutter_navigations/ogrenci_listedi.dart';

class OgrenciDetay extends StatelessWidget {
  final Ogrenci secilenOgrenci;
  const OgrenciDetay({required this.secilenOgrenci, super.key});

  @override
  Widget build(BuildContext context) {
    var secilen = ModalRoute.of(context)!.settings.arguments as Ogrenci;

    print('secilen ogrenci ::::: ${secilen.isim}');
    return Scaffold(
      appBar: AppBar(title: Text("Ogrenci Detay")),
      body: Center(
        child: Column(
          children: [
            Text(secilenOgrenci.id.toString()),
            Text(secilenOgrenci.isim.toString()),
            Text(secilenOgrenci.soyIsim.toString()),
          ],
        ),
      ),
    );
  }
}
