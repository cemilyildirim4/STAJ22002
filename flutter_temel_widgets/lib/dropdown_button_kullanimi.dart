import 'package:flutter/material.dart';

class DropdownButtonKullanimi extends StatefulWidget {
  const DropdownButtonKullanimi({super.key});

  @override
  State<DropdownButtonKullanimi> createState() =>
      _DropdownButtonKullanimiState();
}

class _DropdownButtonKullanimiState extends State<DropdownButtonKullanimi> {
  String? _secilenSehir = null;
  List<String> _tumSehirler = [
    "Ankara",
    "Izmir",
    "Istanbul",
    "Bursa",
    "Rize",
    "Adıyaman",
    "Konya",
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        hint: Text("Şehir Seçiniz."),
        icon: Icon(Icons.arrow_downward),
        iconSize: 32,
        underline: Container(height: 4, color: Colors.purple),
        items: _tumSehirler
            .map(
              (String oankisehir) =>
                  DropdownMenuItem(child: Text(oankisehir), value: oankisehir),
            )
            .toList(),
        /* DropdownMenuItem(child: Text("Ankara şehri"), value: "Ankara"),
          DropdownMenuItem(child: Text("İzmir şehri"), value: "İzmir"),
          DropdownMenuItem(child: Text("Bursa şehri"), value: "Bursa"), */
        value: _secilenSehir,
        onChanged: (String? yeni) {
          setState(() {
            print("çalıştı");
            _secilenSehir = yeni;
          });
        },
      ),
    );
  }
}
