import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigations/main.dart';
import 'package:flutter_navigations/ogrenci_detay.dart';
import 'package:flutter_navigations/ogrenci_listedi.dart';
import 'package:flutter_navigations/orange_page.dart';
import 'package:flutter_navigations/purple_page.dart';
import 'package:flutter_navigations/yellow_page.dart';

class RouteGenerator {
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _routeOlustur(AnaSayfa(), settings);
      case '/orangePage':
        return _routeOlustur(OrangePage(), settings);
      case '/yellowPage':
        return _routeOlustur(YellowPage(), settings);
      case '/purplePage':
        return _routeOlustur(PurplePage(), settings);
      case '/ogrenciListesi':
        return _routeOlustur(OgrenciListedi(), settings);
      case '/ogrenciDetay':
        var parametredekiOgrenci = settings.arguments as Ogrenci;
        return _routeOlustur(
          OgrenciDetay(secilenOgrenci: parametredekiOgrenci),
          settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(title: Text('404')),
            body: Center(child: Text('Safa bulunamadı')),
          ),
        );
    }
  }

  static PageRoute<dynamic>? _routeOlustur(
    Widget gidilecekWidget,
    RouteSettings settings,
  ) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoPageRoute(
        builder: (context) => gidilecekWidget,
        settings: settings,
      );
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return MaterialPageRoute(
        builder: (context) => gidilecekWidget,
        settings: settings,
      );
    } else {
      return CupertinoPageRoute(
        builder: (context) => gidilecekWidget,
        settings: settings,
      );
    }
  }
}
