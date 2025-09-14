import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigations/green_page.dart';
import 'package:flutter_navigations/orange_page.dart';
import 'package:flutter_navigations/red_page.dart';
import 'package:flutter_navigations/route_generator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      /* home: AnaSayfa(), */
      /* routes: {
        '/redPage': (context) => RedPage(),
        '/': (context) => AnaSayfa(),
        '/orangePage': (context) => OrangePage(),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text('Error')),
          body: Center(child: Text("404")),
        ),
      ), */
      onGenerateRoute: RouteGenerator.routeGenerator,
    );
  }
}

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Material App Bar'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                int? _gelenSayi = await Navigator.push<int>(
                  context,
                  CupertinoPageRoute(builder: (redContext) => RedPage()),
                );
                print('Ana sayfadaki sayi $_gelenSayi');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade300,
              ),
              child: Text(
                "Kırmızı sayfaya gir IOS",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //Navigator.push(context, route);
                Navigator.of(context)
                    .push<int>(
                      MaterialPageRoute(builder: (redContext) => RedPage()),
                    )
                    .then((int? value) {
                      debugPrint('Anasayfadaki sayi $value');
                    });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade600,
              ),
              child: Text(
                "Kırmızı sayfaya gir Android",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).maybePop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade600,
              ),
              child: Text(
                "Maybe Pop Kullanımı",
                style: TextStyle(color: Colors.white),
              ),
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
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => GreenPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade600,
              ),
              child: Text(
                "Push Replacament Kullanımı",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/orangePage');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade600,
              ),
              child: Text(
                "Orange Page PushNamed Kullanımı ",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/yellowPage');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow.shade600,
              ),
              child: Text(
                "PushNamed Yellow Page Git",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).pushNamed('/ogrenciListesi', arguments: 80);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange.shade600,
              ),
              child: Text(
                "Liste Oluştur",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/purplePage', arguments: 80);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.shade600,
              ),
              child: Text(
                "Purple Page git",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
