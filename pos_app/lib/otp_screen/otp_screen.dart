import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:pos_app/colors/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:pos_app/otp_screen/otp_screen_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pos_app/firebase_options.dart';
import 'package:pos_app/router/route_name.dart';
import 'package:pos_app/screens/signup_screen/signup_screen_controller.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({required this.gelenBilgi, super.key});
  /* final String email;
  final String currentCode; */
  final Map gelenBilgi;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: OtpScreenController(gelenBilgi: gelenBilgi),
      builder: (controller) {
        return OtpScreenView(controller: controller);
      },
    );
  }
}

class OtpScreenView extends StatelessWidget {
  OtpScreenView({required this.controller, super.key});
  final OtpScreenController controller;

  final _verifyKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String codeTemp = "";
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Stack(
          children: [
            Container(
              width: 200,
              height: 32,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 96, right: 115, left: 115),
              child: Text(
                "Verification",
                style: TextStyle(
                  color: AppColors.primary06,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 133, left: 44, right: 44),
              child: Row(
                children: [
                  Container(
                    child: Text(
                      "We sent a verification code to ",
                      style: TextStyle(color: AppColors.primary06),
                    ),
                  ),
                  Container(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.only(left: 2),
                        minimumSize: Size(0, 0),
                      ),

                      onPressed: () {},
                      child: Text(
                        "you@example.com",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary06,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Form(
              key: _verifyKey,
              child: Column(
                children: [
                  Container(
                    width: 205,
                    height: 74,
                    margin: EdgeInsets.only(top: 187, left: 74, right: 74),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.primary04),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: OtpTextField(
                      autoFocus: true,
                      showFieldAsBox: false,
                      filled: true,
                      fillColor: Colors.transparent,
                      alignment: Alignment.center,
                      fieldHeight: 50,
                      fieldWidth: 38,
                      borderWidth: 2,
                      numberOfFields: 4,
                      borderColor: controller.gelenBilgi["otpCode"] == null
                          ? AppColors.primary04
                          : Colors.transparent,
                      focusedBorderColor: Colors.transparent,
                      enabledBorderColor: AppColors.primary04,
                      onSubmit: (value) {
                        codeTemp = value.toString();
                        print("${value} ve $codeTemp");
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 24, left: 77, right: 77),
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            "Didn't receive any code? ",
                            style: TextStyle(color: AppColors.primary06),
                          ),
                        ),
                        Container(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.only(left: 2),
                              minimumSize: Size(0, 0),
                            ),
                            onPressed: () {
                              controller.sendCodeOTP(context);
                            },
                            child: Text(
                              "Click to resend",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary06,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 48, left: 16, right: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        print(
                          "${codeTemp}  ve  ${controller.gelenBilgi["otpCode"]}",
                        );
                        if (codeTemp.toString() ==
                            controller.gelenBilgi["otpCode"].toString()) {
                          context.pushNamed(RouteName.card_details_screen);
                        } else {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text("Wrong code")));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(361, 51),
                        backgroundColor: AppColors.primary09,
                        foregroundColor: AppColors.primary06,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(15),
                        ),
                      ),
                      child: Text(
                        "Verify",
                        style: TextStyle(
                          color: AppColors.highlight,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
