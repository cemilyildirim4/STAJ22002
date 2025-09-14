import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:pos_app/screens/signup_screen/signup_screen_controller.dart';

class OtpScreenController extends GetxController {
  OtpScreenController({required this.gelenBilgi});
  /* final String email;
  final String currentCode; */
  final Map gelenBilgi;

  void sendCodeOTP(BuildContext context) async {
    if (await EmailOTP.sendOTP(email: gelenBilgi["email"].toString())) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("OTP has been sent")));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("OTP failed sent")));
    }
    EmailOTP.config(
      otpLength: 4,
      appEmail: gelenBilgi["email"].toString(),
      emailTheme: EmailTheme.v2,
    );
    try {
      gelenBilgi["otpCode"]!.value = EmailOTP.getOTP() ?? "";
    } catch (e) {
      print("Otp code başarızı ${e}");
    }

    await ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Gelen kod : ${gelenBilgi["otpCode"]}")),
    );
  }
}
