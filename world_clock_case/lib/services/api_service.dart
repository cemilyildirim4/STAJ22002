import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _apiKey =
      '04ZO7QJFWXM2'; // <-- API anahtarını buraya ekle
  static const String _baseUrl = 'http://api.timezonedb.com/v2.1';
  late String zoneNanme;

  /// Tüm zaman dilimlerini getirir
  static Future<List<String>> fetchTimezones() async {
    final uri = Uri.parse('$_baseUrl/list-time-zone?key=$_apiKey&format=json');
    final response = await http.get(uri);
    print('Status Code: ${response.statusCode}');
    print(
      'Response Body: ${response.body.substring(0, min(200, response.body.length))}',
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'OK') {
        List<dynamic> zones = data['zones'];

        return zones.map((z) => z['zoneName'] as String).toList();
      } else {
        throw Exception('API hatası: ${data['message']}');
      }
    } else {
      throw Exception('Zaman dilimleri alınamadı');
    }
  }

  /// Belirli bir zaman dilimi için anlık saat bilgisini getirir
  static Future<String> fetchTime(String timezone) async {
    final uri = Uri.parse(
      '$_baseUrl/get-time-zone?key=$_apiKey&format=json&by=zone&zone=$timezone',
    );
    final response = await http.get(uri);
    final data2 = jsonDecode(response.body);
    String bolgeIsmi = data2["zoneName"];
    String abrev = data2["abbreviation"];
    String gunAyYilSaat = data2["formatted"];
    print(
      "Gerekli elemanlar \n 1.Bölge ismi $bolgeIsmi \n 2.Abrev $abrev \n $gunAyYilSaat ",
    );
    print(bolgeIsmi);
    print('GetTime Status: ${response.statusCode}');
    print('GetTime Body: ${response.body}');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'OK') {
        return data['formatted'] as String;
      } else {
        throw Exception('API hatası: ${data['message']}');
      }
    } else {
      throw Exception('Saat verisi alınamadı');
    }
  }

  static Future<List> page2Elemanlari(String timezone) async {
    final uri = Uri.parse(
      '$_baseUrl/get-time-zone?key=$_apiKey&format=json&by=zone&zone=$timezone',
    );
    final response = await http.get(uri);
    final data2 = jsonDecode(response.body);
    List<String> elemanListesi = [];
    String bolgeIsmi = data2["zoneName"];
    String abrev = data2["abbreviation"];
    String gunAyYilSaat = data2["formatted"];
    elemanListesi.addAll([bolgeIsmi, abrev, gunAyYilSaat]);
    return elemanListesi;
  }
}
