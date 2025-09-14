import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:pos_app/otp_screen/otp_screen_controller.dart';
import 'package:pos_app/router/route_name.dart';
import 'package:email_otp/email_otp.dart';

final FirebaseFirestore _firebase = FirebaseFirestore.instance;

class SignupScreenController extends GetxController {
  var userName = "".obs;
  var email = "".obs;
  var password = "".obs;
  var phone = "".obs;
  var otpCode = "".obs;

  void submit(GlobalKey<FormState> formkey, BuildContext context) async {
    final _isValid = formkey.currentState!.validate();

    try {
      if (_isValid) {
        try {
          final createUser = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                email: email.value,
                password: password.value,
              );
        } catch (e) {
          print("YENİ KULLANICI EKLERKEN HATA");
          throw e;
        }
        final users = await FirebaseFirestore.instance.collection(
          "kullanicilar",
        );
        users.add({
          "username": userName.value,
          "password": password.value,
          "email": email.value,
          "phone": phone.value,
        });
        sendCode(context);
        context.pushNamed(
          RouteName.otp_screen,
          extra: {"email": email.value, "otpCode": otpCode.value},
        );
      }
    } catch (e) {
      print("Kullanıcı eklenemedi $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          action: SnackBarAction(label: "Kapat", onPressed: () {}),
          content: Text("Kullanıcı eklenemdi"),
        ),
      );
    }
  }

  void sendCode(BuildContext context) async {
    EmailOTP.config(
      otpLength: 4,
      appEmail: email.value,
      emailTheme: EmailTheme.v1,
    );

    if (await EmailOTP.sendOTP(email: email.value)) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("OTP has been sent")));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("OTP failed sent")));
    }
    otpCode.value = EmailOTP.getOTP().toString();

    print(EmailOTP.getOTP());
    await ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Gelen kod : ${EmailOTP.getOTP().toString()}")),
    );
  }
}
