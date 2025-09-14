import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _apiKey = '04ZO7QJFWXM2'; // <-- BURAYA kendi key'ini yaz
  static const String _baseUrl = 'http://api.timezonedb.com/v2.1';

  static Future<List<String>> fetchTimezones() async {
    final uri = Uri.parse('$_baseUrl/list-time-zone?key=$_apiKey&format=json');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final zones = data['zones'] as List<dynamic>;
      return zones.map((zone) => zone['zoneName'].toString()).toList();
    } else {
      throw Exception('Zaman dilimleri alınamadı');
    }
  }
}
