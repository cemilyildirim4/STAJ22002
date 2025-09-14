import 'package:flutter/material.dart';

class OrangePage extends StatelessWidget {
  const OrangePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orange Page"),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Center(child: Text("Orange Page", style: TextStyle(fontSize: 24))),
          ElevatedButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple.shade600,
            ),
            child: Text(
              "En başa geri dön ",
              style: TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/purplePage');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange.shade600,
            ),
            child: Text(
              "Mora geri dön ",
              style: TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.popUntil(
                context,
                (route) => route.settings.name == '/',
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade600,
            ),
            child: Text(
              "En başa geri dön ",
              style: TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                "/yellowPage",
                (route) => route.isFirst,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade600,
            ),
            child: Text(
              "Sarıyı ana sayfadan sonra ekle ",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
