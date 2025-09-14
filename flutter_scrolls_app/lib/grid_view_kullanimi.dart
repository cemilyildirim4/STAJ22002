import 'package:flutter/material.dart';

class GridViewKullanimi extends StatelessWidget {
  const GridViewKullanimi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gridview  Dersleri"),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        backgroundColor: Colors.teal.shade300,
      ),

      body: GridView.builder(
        itemCount: 100,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),

                boxShadow: [
                  BoxShadow(
                    color: Colors.green.shade200,
                    offset: Offset(10, 5),
                  ),
                ],
                border: BoxBorder.all(
                  color: Colors.blue.shade100,
                  width: 7,
                  style: BorderStyle.solid,
                ),
                color: Colors.red[100 * ((index + 1) % 9)],
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.green],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                image: DecorationImage(
                  image: AssetImage("assets/images/car.jpg"),
                  alignment: Alignment.topCenter,
                ),
              ),
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.all(20),
              child: Padding(
                padding: EdgeInsets.all(2),
                child: Text(
                  "Merhaba Flutter $index",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
            onTap: () => debugPrint("Merhaba flutter $index tıklanıldı"),
            onDoubleTap: () =>
                debugPrint("Merhaba flutter $index çift tıklanıldı"),
            onLongPress: () => debugPrint("Merhaba flutter $index uzunbasıldı"),
            onHorizontalDragStart: (e) =>
                debugPrint("Merhaba flutter $index hover oldu $e"),
          );
        },
      ),
    );
  }

  GridView gridViewExtent() {
    return GridView.extent(
      maxCrossAxisExtent: 600,
      /*      reverse: true, */
      primary: false,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(10),
      crossAxisSpacing: 20,
      mainAxisSpacing: 40,
      children: [
        merhabaFlutterContainer(1),
        merhabaFlutterContainer(2),
        merhabaFlutterContainer(3),
        merhabaFlutterContainer(4),
        merhabaFlutterContainer(5),
        merhabaFlutterContainer(6),
        merhabaFlutterContainer(7),
        merhabaFlutterContainer(8),
        merhabaFlutterContainer(9),
        merhabaFlutterContainer(10),
        merhabaFlutterContainer(11),
      ],
    );
  }

  GridView gridViewCount() {
    return GridView.count(
      reverse: true,
      crossAxisCount: 2,
      primary: false,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(10),
      crossAxisSpacing: 20,
      mainAxisSpacing: 40,
      children: [
        merhabaFlutterContainer(1),
        merhabaFlutterContainer(2),
        merhabaFlutterContainer(3),
        merhabaFlutterContainer(4),
        merhabaFlutterContainer(5),
        merhabaFlutterContainer(6),
        merhabaFlutterContainer(7),
        merhabaFlutterContainer(8),
        merhabaFlutterContainer(9),
        merhabaFlutterContainer(10),
        merhabaFlutterContainer(11),
      ],
    );
  }

  Container merhabaFlutterContainer(int sayi) {
    return Container(
      color: Colors.teal.shade300,

      child: Text("Merhaba flutter $sayi", textAlign: TextAlign.center),
      alignment: Alignment.center,
    );
  }

  Container merhabaFlutterContainer2(int sayi, int index) {
    return Container(
      color: Colors.teal[100 * (index % 5)],

      child: Text("Merhaba flutter $sayi", textAlign: TextAlign.center),
      alignment: Alignment.center,
    );
  }
}
