import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomScrollVeSlivers extends StatelessWidget {
  const CustomScrollVeSlivers({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.orange,
          expandedHeight: 200,
          floating: false,
          pinned: true,
          snap: false,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              "Custom Scroolview App",
              style: TextStyle(color: Colors.yellow.shade100),
            ),
            centerTitle: true,
            background: Image.asset("assets/images/car.jpg", fit: BoxFit.cover),
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          delegate: SliverChildListDelegate(sabitListeElemanlari),
        ),
        //dinamik (builder ile üretilen) elemanlarla bir satırda kaç eleman olacağını söylediğimiz grid türü
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            _dinamikElemanUretenFonksiyon,
            childCount: 6,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
        ),
        //dinamik (builder ile üretilen) elemanlarla bir satırdaki  bir elemanın max genişliğini söylediğmiz grid türü
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            _dinamikElemanUretenFonksiyon,
            childCount: 6,
          ),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
          ),
        ),
        SliverGrid.count(crossAxisCount: 6, children: sabitListeElemanlari),
        SliverGrid.extent(
          maxCrossAxisExtent: 300,
          children: sabitListeElemanlari,
        ),
        SliverPadding(
          padding: EdgeInsets.all(4),
          sliver: SliverList(
            delegate: SliverChildListDelegate(sabitListeElemanlari),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(10),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              _dinamikElemanUretenFonksiyon,
              childCount: 6,
            ),
          ),
        ),
        SliverFixedExtentList(
          delegate: SliverChildListDelegate(sabitListeElemanlari),
          itemExtent: 300,
        ),
        SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate(
            _dinamikElemanUretenFonksiyon,
            childCount: 6,
          ),
          itemExtent: 50,
        ),
      ],
    );
  }

  List<Widget> get sabitListeElemanlari {
    return [
      listeElemanContainer(renk: Colors.amber, sayi: 1),
      listeElemanContainer(renk: Colors.blue, sayi: 2),
      listeElemanContainer(renk: Colors.orange, sayi: 3),
      listeElemanContainer(renk: Colors.cyan, sayi: 4),
      listeElemanContainer(renk: Colors.red, sayi: 5),
      listeElemanContainer(renk: Colors.purple, sayi: 6),
    ];
  }

  Container listeElemanContainer({Color? renk, int? sayi}) {
    return Container(
      height: 100,
      color: renk,
      alignment: Alignment.center,
      child: Text(
        "Sabit liste elemanı $sayi",
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }

  Container listeElemanContainerRastgeleRenk({int? sayi}) {
    return Container(
      height: 100,
      color: _rastgeleRenkUret(),
      alignment: Alignment.center,
      child: Text(
        "Dinamik liste elemanı $sayi",
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget? _dinamikElemanUretenFonksiyon(BuildContext context, int index) {
    return listeElemanContainerRastgeleRenk(sayi: index + 1);
  }

  Color _rastgeleRenkUret() {
    return Color.fromARGB(
      math.Random().nextInt(255),
      math.Random().nextInt(255),
      math.Random().nextInt(255),
      math.Random().nextInt(255),
    );
  }
}
