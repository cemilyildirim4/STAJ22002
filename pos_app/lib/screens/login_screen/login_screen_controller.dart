import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:go_router/go_router.dart';
import 'package:pos_app/router/route_name.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

final _firebase = FirebaseAuth.instance;

class LoginScreenController extends GetxController {
  var email = "".obs;
  var password = "".obs;
  final String url = 'https://www.google.com';

  void submit({
    required GlobalKey<FormState> formKey,
    required BuildContext context,
  }) async {
    final _isValid = formKey.currentState!.validate();

    try {
      if (_isValid) {
        try {
          final userCredential = await _firebase.signInWithEmailAndPassword(
            email: email.value,
            password: password.value,
          );
          context.pushNamed(RouteName.card_details_screen);
        }
         catch (exception) {
          print("kayıtlı olmayan email $exception");
          final snackBar = SnackBar(
            content: Text("Invalid mail adress or password"),
            action: SnackBarAction(label: "Kapat", onPressed: () {}),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } else {
        return;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> linkeGit() async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Link açılamadı';
    }
  }
}
