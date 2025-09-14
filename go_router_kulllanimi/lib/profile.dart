import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_kulllanimi/route_name.dart';

class Profile extends StatelessWidget {
  final String name;
  final String surname;
  final Map<String, dynamic> bilgi;
  Profile({
    required this.bilgi,
    required this.name,
    required this.surname,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome ${name} ${surname}")),
      body: Center(
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  /* GoRouter.of(context).go("/"); */
                  context.goNamed(RouteName.dashboard);
                },
                child: Text("Dashboard"),
              ),
            ),
            Container(child: bilgiYazdir()),
          ],
        ),
      ),
    );
  }

  Widget bilgiYazdir() {
    return Text(
      "Yas : ${bilgi["yas"]}\nBoy : ${bilgi["boy"]}\nMeslek :${bilgi["meslek"]}",
    );
  }
}
