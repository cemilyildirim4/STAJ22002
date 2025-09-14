import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:world_clock_case/colors/colors.dart';
import 'package:world_clock_case/constants/app_settings.dart';
import 'package:world_clock_case/world_clock_page.dart';
import 'package:world_clock_case/services/api_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List<String> zamanDilimiListesi = [];
  bool isLoading = true;
  String searchQuery = ''; // arama query'si için state
  late DateTime now;

  bool darkBool = true;
  Color backgroundColor = AppColors.white;
  Color fontColor = AppColors.dark;
  Color appBarColor = AppColors.lightBlue;
  Color IconColor = AppColors.dark;

  late String gun;
  late String ay;
  late String gunSayi;

  late String saat;
  late String dk;

  late String nameOfUser;

  String star = "assets/svgs/Star.svg";
  String iconRight = "assets/svgs/arrow-right.svg";

  @override
  void initState() {
    super.initState();
    loadTimezones();
    loadTimeNow();
    loadUserName();
  }

  loadUserName() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      nameOfUser = user.email.toString().split("@")[0] as String;
    }
  }

  loadTimeNow() async {
    await initializeDateFormatting('tr_TR', null);
    Intl.defaultLocale = 'tr_TR';
    setState(() {
      now = DateTime.now();
      gun = DateFormat('EEEE').format(now);
      gunSayi = DateFormat('d').format(now);
      ay = DateFormat('MMMM').format(now);
      saat = DateFormat('HH').format(now);
      dk = DateFormat("mm").format(now);
    });
  }

  Future<void> loadTimezones() async {
    try {
      final zones = await ApiService.fetchTimezones();
      setState(() {
        zamanDilimiListesi = zones;
        isLoading = false;
      });
    } catch (e) {
      print('Hata: $e');
      setState(() {
        zamanDilimiListesi = ['Zaman dilimleri alınamadı'];
        isLoading = false;
      });
    }
  }

  // Arama sonucu filtrelenmiş liste
  List<String> get filteredTimezones {
    if (searchQuery.isEmpty) {
      return zamanDilimiListesi;
    }
    return zamanDilimiListesi
        .where((zone) => zone.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    print("DENEME DATETİME.NOW : $gun $gunSayi");

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              child: Container(
                width: double.infinity,
                height: 200,
                padding: const EdgeInsets.fromLTRB(24, 40, 24, 20),
                color: appBarColor,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              'Günaydın, $nameOfUser!',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: fontColor,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              '$saat : $dk',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: fontColor,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 34),
                            child: Text(
                              '$gunSayi $ay, $gun',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: fontColor,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Sağ üst köşeye SVG ikon
                    Positioned(
                      top: 36,
                      left: 268,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(
                            20,
                          ), // isteğe göre radius
                          onTap: () {
                            setState(() {
                              darkBool = !darkBool;
                              star = darkBool
                                  ? "assets/svgs/Star.svg"
                                  : "assets/svgs/Star-light.svg";
                              backgroundColor = darkBool
                                  ? AppColors.white
                                  : AppColors.dark;
                              fontColor = darkBool
                                  ? AppColors.dark
                                  : AppColors.white;
                              appBarColor = darkBool
                                  ? AppColors.lightBlue
                                  : AppColors.dark2;
                              IconColor = darkBool
                                  ? AppColors.dark
                                  : AppColors.lightBlue;
                            });
                          },

                          child: SvgPicture.asset(star, width: 41, height: 40),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Arama çubuğu, appbarın hemen altında
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              transform: Matrix4.translationValues(0, -25, 0),
              child: Material(
                elevation: 6,
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Zaman dilimi ara...',
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 14,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: 2),

            // Liste kısmı
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : filteredTimezones.isEmpty
                  ? const Center(child: Text('Sonuç bulunamadı'))
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 33),
                      itemCount: filteredTimezones.length,
                      itemBuilder: (context, index) {
                        final zone = filteredTimezones[index];
                        final isError = (zone == 'Zaman dilimleri alınamadı');
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Container(
                            decoration: BoxDecoration(
                              color: appBarColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              title: Text(
                                zone,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: fontColor,
                                ),
                              ),
                              trailing: isError
                                  ? null
                                  : Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: backgroundColor,
                                            width: 5,
                                          ),
                                          color: appBarColor,
                                          shape: BoxShape.circle,
                                        ),

                                        transform: Matrix4.translationValues(
                                          45,
                                          0,
                                          0,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: SvgPicture.asset(
                                            color: IconColor,
                                            iconRight,
                                            width: 17,
                                            height: 17,
                                          ),
                                        ),
                                      ),
                                    ),
                              onTap: isError
                                  ? null
                                  : () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => WorldClockPage(
                                            timezone: zone,
                                            darkBool: darkBool,
                                          ),
                                        ),
                                      );
                                    },
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
