import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RedPage extends StatelessWidget {
  int _rastgeleSayi = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print("On will pop çalıştı");
        _rastgeleSayi = Random().nextInt(100);
        Navigator.of(context).pop(_rastgeleSayi);

        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Red Page"),
          backgroundColor: Colors.red,
          automaticallyImplyLeading: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Red Page", style: TextStyle(fontSize: 24)),
              ElevatedButton(
                onPressed: () async {
                  _rastgeleSayi = Random().nextInt(100);
                  print("Üretilen sayi $_rastgeleSayi");
                  Navigator.of(context).pop(_rastgeleSayi);
                },
                child: Text("Geri dön"),
              ),
              ElevatedButton(
                onPressed: () {
                  if (Navigator.of(context).canPop()) {
                    print("Evet pop olabilir");
                  } else {
                    print("hayır olamaz");
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade600,
                ),
                child: Text(
                  "Can Pop Kullanımı",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/orangePage');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade600,
                ),
                child: Text(
                  "go to orange Kullanımı",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
