import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ListviewKullanimi extends StatelessWidget {
  ListviewKullanimi({super.key});
  List<Ogrenci> tumOgrenciler = List.generate(
    500,
    (index) => Ogrenci(
      index + 1,
      "Ogrenci adı ${index + 1}",
      "Ogrenci soyadı ${index + 1}",
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci Listesi"),
        backgroundColor: Colors.teal,
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          var oankiOgrenci = tumOgrenciler[index];
          return Card(
            color: index % 2 == 0 ? Colors.orange : Colors.purple,
            child: ListTile(
              onTap: () {
                print("elemana tıklandı ${index + 1}");
                EasyLoading.showToast(
                  "Eleman tıklandı",
                  duration: Duration(seconds: 3),
                  dismissOnTap: true,
                  toastPosition: EasyLoadingToastPosition.bottom,
                );
              },
              onLongPress: () {
                _alertDialogIslemleri(context, oankiOgrenci);
                print(oankiOgrenci);
              },
              title: Text(oankiOgrenci.isim),
              subtitle: Text(oankiOgrenci.soyisim),
              leading: CircleAvatar(child: Text(oankiOgrenci.id.toString())),
            ),
          );
        },
        itemCount: tumOgrenciler.length,
        separatorBuilder: (context, index) {
          if ((index + 1) % 4 == 0) {
            return Divider(thickness: 2, color: Colors.teal);
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }

  ListView classicListView() {
    return ListView(
      children: tumOgrenciler
          .map(
            (Ogrenci ogr) => ListTile(
              title: Text(ogr.isim),
              subtitle: Text(ogr.soyisim),
              leading: CircleAvatar(child: Text(ogr.id.toString())),
            ),
          )
          .toList(),
    );
  }

  void _alertDialogIslemleri(BuildContext MyContext, Ogrenci secilen) {
    showDialog(
      barrierDismissible: false,
      context: MyContext,
      builder: (context) {
        return AlertDialog(
          title: Text(secilen.toString()),
          content: SingleChildScrollView(
            child: Column(children: [Text("Emre" * 100), Text("Emre2" * 100)]),
          ),
          actions: [
            ButtonBar(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("KAPAT"),
                ),
                TextButton(onPressed: () {}, child: Text("TAMAM")),
              ],
            ),
          ],
        );
      },
    );
  }
}

class Ogrenci {
  final int id;
  final String isim;
  final String soyisim;

  Ogrenci(this.id, this.isim, this.soyisim);

  @override
  String toString() =>
      "Öğrenci ismi : $isim Öğrenci soyismi : $soyisim  Öğrenci id : $id ";
}
