import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('tr')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy Localization Demo',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title').tr(), // tr() ile çeviriyi alıyoruz
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('welcome').tr(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Dil değiştir: Türkçe <-> İngilizce
                if (context.locale.languageCode == 'en') {
                  context.setLocale(const Locale('tr'));
                } else {
                  context.setLocale(const Locale('en'));
                }
              },
              child: const Text('Change Language'),
            ),
          ],
        ),
      ),
    );
  }
}
