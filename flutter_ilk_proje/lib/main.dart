import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String _img1 =
      'https://images.pexels.com/photos/575386/pexels-photo-575386.jpeg';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false, // Material 2 davranışı için
        primaryColor: Colors.teal,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.purple, // eski accentColor karşılığı
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Başlık'), backgroundColor: Colors.teal),
        /* body:Center(
          child: Container(
          width: 200,
          height: 200,
          color:Colors.red,
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            margin: EdgeInsets.all(40),
            width: 50,
            height: 50,
            child:Text("emre"),
          ),

        )) */
        /* body: Center(
        widthFactor: 3,
        heightFactor: 3,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.red,
          child: Text("emre"),
        ),
       ) */
        body: Center(
          child: Stack(
            children: [
              // Yatay D A R T harfleri
              Positioned(
                top: 0,
                left: 0,
                child: Row(
                  children: [
                    _harfKutusu("D"),
                    _harfKutusu("A"),
                    _harfKutusu("R"),
                    _harfKutusu("T"),
                  ],
                ),
              ),
              // D harfinin altına dikey E R S L E R İ harfleri
              Positioned(
                top: 60, // D harfinin altına gelecek şekilde boşluk bırakıldı
                left: 0, // D harfi solda olduğu için hizalı
                child: Column(
                  children: [
                    _harfKutusu("E"),
                    _harfKutusu("R"),
                    _harfKutusu("S"),
                    _harfKutusu("L"),
                    _harfKutusu("E"),
                    _harfKutusu("R"),
                    _harfKutusu("İ"),
                  ],
                ),
              ),
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint('Tıklandı!');
          },
          backgroundColor:
              Colors.purple, // burası artık colorScheme.secondary olurdu
          child: Icon(Icons.account_circle_rounded),
        ),
      ),
    );
  }

  Widget _harfKutusu(String harf) {
    return Container(
      margin: EdgeInsets.all(4),
      width: 50,
      height: 50,
      color: Colors.orange,
      alignment: Alignment.center,
      child: Text(harf, style: TextStyle(fontSize: 25)),
    );
  }

  List<Widget> get sorunluContainer {
    return [
      Container(width: 75, height: 75, color: Colors.yellow),
      Container(width: 75, height: 75, color: Colors.red),
      Container(width: 75, height: 75, color: Colors.blue),
      Container(width: 75, height: 75, color: Colors.blue),
      Container(width: 75, height: 75, color: Colors.orange),
    ];
  }

  List<Widget> get flexibleContainer {
    return [
      Flexible(
        flex: 1,
        child: Container(width: 50, height: 300, color: Colors.yellow),
      ),
      Flexible(
        flex: 1,
        child: Container(width: 100, height: 300, color: Colors.blue),
      ),
      Flexible(
        flex: 1,
        child: Container(width: 100, height: 300, color: Colors.orange),
      ),
      Flexible(
        flex: 1,
        child: Container(width: 100, height: 300, color: Colors.green),
      ),
      Flexible(
        flex: 1,
        child: Container(width: 200, height: 300, color: Colors.red),
      ),
    ];
  }

  List<Widget> get expandedContainer {
    return [
      Expanded(
        flex: 1,
        child: Container(width: 75, height: 75, color: Colors.yellow),
      ),
      Expanded(
        flex: 2,
        child: Container(width: 75, height: 75, color: Colors.red),
      ),
      Expanded(
        flex: 4,
        child: Container(width: 75, height: 75, color: Colors.blue),
      ),
      Expanded(
        flex: 3,
        child: Container(width: 75, height: 75, color: Colors.orange),
      ),
      Expanded(
        flex: 7,
        child: Container(width: 75, height: 75, color: Colors.blue),
      ),
      Expanded(
        flex: 1,
        child: Container(width: 75, height: 75, color: Colors.red),
      ),
    ];
  }

  Container containerDersleri2() {
    return Container(
      color: Colors.red.shade300,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [Text("E"), Text("M"), Text("R"), Text("E")],
          ),

          Icon(Icons.add_circle, size: 64, color: Colors.green),
          Icon(Icons.add_circle, size: 64, color: Colors.red),
          Icon(Icons.add_circle, size: 64, color: Colors.blue),
          Icon(Icons.add_circle, size: 64, color: Colors.orange),
        ],
      ),
    );
  }

  Widget containerDersleri() {
    return Center(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text("emre", style: TextStyle(fontSize: 128)),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(width: 4, color: Colors.purple),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          image: DecorationImage(
            image: NetworkImage(_img1),
            fit: BoxFit.cover,
            repeat: ImageRepeat.repeat,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.green,
              offset: Offset(0, 20),
              blurRadius: 10,
            ),
            BoxShadow(
              color: Colors.yellow,
              offset: Offset(0, -20),
              blurRadius: 10,
            ),
          ],
        ),
      ),
    );
  }
}
