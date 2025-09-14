import 'package:flutter/material.dart';

class PopupmenuKullanimi extends StatefulWidget {
  const PopupmenuKullanimi({super.key});

  @override
  State<PopupmenuKullanimi> createState() => _PopupmenuKullanimiState();
}

class _PopupmenuKullanimiState extends State<PopupmenuKullanimi> {
  String _secilenSehir = "";
  List<String> renkler = ['mavi', 'yeşil', 'kırmızı', 'sari', 'siyah'];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: PopupMenuButton<String>(
        onSelected: (String sehir) {
          print("Seçilen şehir $sehir");
          _secilenSehir = sehir;
        },
        itemBuilder: (BuildContext context) {
          return renkler
              .map(
                (String renk) => PopupMenuItem(child: Text(renk), value: renk),
              )
              .toList();  
          /*<PopupMenuEntry<String>>[
             PopupMenuItem(child: Text("Ankara"), value: "Ankara"),
            PopupMenuItem(child: Text("Bursa"), value: "Bursa"),
            PopupMenuItem(child: Text("İzmir"), value: "İzmir"), 
          ];*/
        },
        icon: Icon(Icons.add),
      ),
    );
  }
}
