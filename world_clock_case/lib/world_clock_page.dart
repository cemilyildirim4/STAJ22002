import 'package:flutter/material.dart';
import 'package:world_clock_case/colors/colors.dart';
import 'package:world_clock_case/constants/app_settings.dart';
import 'package:world_clock_case/services/api_service.dart';
import 'home_page_screen/home_page_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class WorldClockPage extends StatefulWidget {
  final String timezone;
  final bool darkBool;
  const WorldClockPage({
    super.key,
    required this.timezone,
    required this.darkBool,
  });
  @override
  _WorldClockPageState createState() => _WorldClockPageState();
}

Map<String, Color> lightMap = {
  "bgColor": AppColors.white,
  "fontColor": AppColors.dark,
  "appBarColor": AppColors.lightBlue,
  "timeBg": AppColors.white,
  "border": AppColors.dark,
};

Map<String, Color> darkMap = {
  "bgColor": AppColors.dark,
  "fontColor": AppColors.white,
  "appBarColor": AppColors.dark2,
  "timeBg": AppColors.dark2,
  "border": AppColors.dark,
};

Map<String, Color> renkTemaControl(tema) {
  if (tema) {
    print("RENK TEMASI LİGHT");
    return lightMap;
  } else {
    print("RENK TEMASI DARK");
    return darkMap;
  }
}

class _WorldClockPageState extends State<WorldClockPage> {
  bool isLoading = true;
  String? formattedTime;

  List<dynamic>? gelenElemanlar;
  String? temp;

  String? eleman1;
  String? eleman2;
  String? eleman3;

  String? saat;
  String? dk;
  String? sehir;
  String? bolge;
  String? gunIsmi;
  String? abrev;
  String? ay;
  String? gunSayi;
  String? yil;

  Color backgroundColor = AppColors.white;
  Color fontColor = AppColors.dark;
  Color appBarColor = AppColors.lightBlue;

  String star = "assets/svgs/Star.svg";
  String iconRight = "assets/svgs/arrow-right.svg";

  @override
  void initState() {
    super.initState();
    loadData();
    renkTemaControl(widget.darkBool);
  }

  Future<void> loadData() async {
    final results = await Future.wait<Object>([
      ApiService.fetchTime(widget.timezone),
      ApiService.page2Elemanlari(widget.timezone),
    ]);

    String time = results[0] as String;
    formattedTime = time;
    List<String> elemanlar = results[1] as List<String>;

    String zaman = elemanlar[2].split(" ")[0]; // 2025-08-06
    String zaman2 = elemanlar[2].split(" ")[1];

    await initializeDateFormatting('tr_TR', null);
    Intl.defaultLocale = 'tr_TR';
    final DateTime parsed = DateTime.parse(zaman);
    final gun = DateFormat('EEEE').format(parsed);
    final ayAdi = DateFormat('MMMM').format(parsed);

    setState(() {
      gelenElemanlar = elemanlar;
      bolge = gelenElemanlar?[0].toString().split("/")[0];
      sehir = gelenElemanlar?[0].toString().split("/")[1];
      eleman1 = elemanlar[2];
      yil = zaman.split("-")[0];
      gunSayi = zaman.split("-")[2];
      saat = zaman2.split(":")[0];
      dk = zaman2.split(":")[1];
      gunIsmi = gun;
      ay = ayAdi;
      isLoading = false;
    });
  }

  Future<void> loadTime() async {
    try {
      final time = await ApiService.fetchTime(widget.timezone);
      print(time);
      setState(() {
        formattedTime = time;
        isLoading = false;
      });
    } catch (e) {
      print('Saat Hatasi: $e');
      setState(() {
        formattedTime = 'Veri alınamadı.';
        isLoading = false;
      });
    }
  }

  Future<void> elemlariAl() async {
    try {
      final elemanlar = await ApiService.page2Elemanlari(widget.timezone);
      print(elemanlar);

      String zaman = elemanlar[2].split(" ")[0]; // 2025-08-06
      String zaman2 = elemanlar[2].split(" ")[1];

      await initializeDateFormatting('tr_TR', null);
      Intl.defaultLocale = 'tr_TR';
      final DateTime parsed = DateTime.parse(zaman);
      final gun = DateFormat('EEEE').format(parsed);
      final ayAdi = DateFormat('MMMM').format(parsed);
      gelenElemanlar?[0].toString().split("/")[0];

      setState(() {
        gelenElemanlar = elemanlar;
        eleman1 = elemanlar[2];

        yil = zaman.split("-")[0];
        gunSayi = zaman.split("-")[2];
        saat = zaman2.split(":")[0];
        dk = zaman2.split(":")[1];
        gunIsmi = gun;
        ay = ayAdi;
        isLoading = false;
      });

      print("AY: $ay  GÜN: $gunIsmi");
    } catch (e) {
      print("Elemanlar alınamadı: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    renkTemaControl(widget.darkBool);
    return Scaffold(
      backgroundColor: renkTemaControl(widget.darkBool)["bgColor"],
      body: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child: Container(
              width: double.infinity,
              height: 110,
              padding: const EdgeInsets.fromLTRB(24, 40, 24, 20),
              color: renkTemaControl(widget.darkBool)["appBarColor"],
              child: AppBar(
                iconTheme: IconThemeData(
                  color: renkTemaControl(widget.darkBool)["fontColor"],
                ),
                backgroundColor: renkTemaControl(
                  widget.darkBool,
                )["appBarColor"],
                title: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    "WORLD TIME",
                    style: GoogleFonts.montserrat(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: renkTemaControl(widget.darkBool)["fontColor"],
                    ),
                  ),
                ),
              ),
            ),
          ),
          isLoading
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 0,
                            top: 50,
                            right: 16,
                            left: 16,
                          ),
                          child: Expanded(
                            child: Align(
                              child: Container(
                                width: 140,
                                height: 140,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: renkTemaControl(
                                    widget.darkBool,
                                  )["timeBg"],
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: renkTemaControl(
                                      widget.darkBool,
                                    )["border"]!,
                                    width: 3,
                                  ),
                                ),
                                child: Text(
                                  "$saat",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 79,
                                    fontWeight: FontWeight.bold,
                                    color: renkTemaControl(
                                      widget.darkBool,
                                    )["fontColor"],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                bottom: 0,
                                top: 50,
                                right: 0,
                                left: 0,
                              ),
                              child: Container(
                                child: Text(
                                  ":",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 59,
                                    fontWeight: FontWeight.bold,
                                    color: renkTemaControl(
                                      widget.darkBool,
                                    )["fontColor"],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 0,
                            top: 50,
                            right: 16,
                            left: 16,
                          ),
                          child: Expanded(
                            child: Align(
                              child: Container(
                                width: 140,
                                height: 140,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: renkTemaControl(
                                    widget.darkBool,
                                  )["timeBg"],
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: renkTemaControl(
                                      widget.darkBool,
                                    )["border"]!,
                                    width: 3,
                                  ),
                                ),
                                child: Text(
                                  "$dk",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 79,
                                    fontWeight: FontWeight.bold,
                                    color: renkTemaControl(
                                      widget.darkBool,
                                    )["fontColor"],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 28),
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              "${gelenElemanlar?[0].toString().split("/")[1]}",
                              style: GoogleFonts.montserrat(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: renkTemaControl(
                                  widget.darkBool,
                                )["fontColor"],
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "${gelenElemanlar?[0].toString().split("/")[0]}",
                              style: GoogleFonts.montserrat(
                                fontSize: 24,
                                fontWeight: FontWeight.normal,
                                color: renkTemaControl(
                                  widget.darkBool,
                                )["fontColor"],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              child: Text(
                                "$gunIsmi,  GMT +01:00",
                                style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: renkTemaControl(
                                    widget.darkBool,
                                  )["fontColor"],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "${ay} $gunSayi,${yil}",
                              style: GoogleFonts.montserrat(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: renkTemaControl(
                                  widget.darkBool,
                                )["fontColor"],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

/* Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Scaffold(
        appBar: AppBar(title: Text("WORLD TIME")),
        body: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : Text(
                  'Saat: ${formattedTime ?? ''}',
                  style: const TextStyle(fontSize: 14),
                ),
        ),
      ),
    ); */
