import 'package:flutter/material.dart';
import 'api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TimezoneListPage());
  }
}

class TimezoneListPage extends StatefulWidget {
  @override
  _TimezoneListPageState createState() => _TimezoneListPageState();
}

class _TimezoneListPageState extends State<TimezoneListPage> {
  List<String> _timezones = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    loadTimezones();
  }

  Future<void> loadTimezones() async {
    try {
      final result = await ApiService.fetchTimezones();
      setState(() {
        _timezones = result;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _timezones = ['Zaman dilimi alınamadı: $e'];
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Zaman Dilimleri')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _timezones.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(_timezones[index]));
              },
            ),
    );
  }
}
