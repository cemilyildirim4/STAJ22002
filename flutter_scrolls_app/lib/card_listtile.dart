import 'package:flutter/material.dart';

class CardveListtileKullanimi extends StatelessWidget {
  const CardveListtileKullanimi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Card ve List tile")),

      body: Center(
        child: ListView(
          reverse: true ,
          children: [
            tekListeElemani(),
            tekListeElemani(),
            tekListeElemani(),
            tekListeElemani(),
            tekListeElemani(),
            tekListeElemani(),
            tekListeElemani(),
            tekListeElemani(),
            tekListeElemani(),
            tekListeElemani(),
            Text("deneme"),
            ElevatedButton(onPressed: () {}, child: Text("deneme button")),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView singleChildKullan() {
    return SingleChildScrollView(
      child: Column(
        children: [
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
        ],
      ),
    );
  }

  Column tekListeElemani() {
    return Column(
      children: [
        Card(
          color: Colors.blue.shade100,
          child: ListTile(
            leading: CircleAvatar(child: Icon(Icons.add)),
            title: Text("Başlık kısmı"),
            subtitle: Text("Alt başlık"),
            trailing: Icon(Icons.real_estate_agent),
          ),
          elevation: 12,
          shadowColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Divider(
          color: Colors.red,
          thickness: 1,
          height: 10,
          indent: 60,
          endIndent: 60,
        ),
      ],
    );
  }
}
