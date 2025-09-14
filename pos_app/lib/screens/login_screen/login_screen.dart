import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:go_router/go_router.dart';
import 'package:pos_app/colors/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_app/router/route_name.dart';
import 'package:pos_app/screens/login_screen/login_screen_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  LoginScreenController c = LoginScreenController();

  final _formKey = GlobalKey<FormState>();
  bool _islogin = false;
  var _enteredEmail = "";
  var _enteredPassword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 32,
              margin: EdgeInsets.only(top: 96, right: 165, left: 165),
              child: Text(
                "Login",
                style: TextStyle(
                  color: AppColors.primary06,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 157, right: 16, left: 16),
                    child: TextFormField(
                      controller: TextEditingController(
                        text: "cemilyyildirim@gmail.com",
                      ),
                      decoration: InputDecoration(
                        hintText: "Email",
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SvgPicture.asset(
                            "assets/images/envelope.fill.svg",
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.borderColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.borderColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.borderColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.borderColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            !value.contains("@")) {
                          return 'Lütfen geçerli bir adres giriniz';
                        }
                        _islogin = true;
                        return null;
                      },
                      onSaved: (value) {
                        c.email.value = value!.trim();
                        print(c.email.value);
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 9, right: 16, left: 16),
                    child: TextFormField(
                      controller: TextEditingController(text: "123456"),
                      decoration: InputDecoration(
                        hintText: "Password",
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SvgPicture.asset(
                            "assets/images/eye.slash.fill.svg",
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.borderColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.borderColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.borderColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.borderColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (value) {
                        if (value!.length >= 6) {
                          return null;
                        } else {
                          return 'Şifre en az 6 karakterden oluşmlalıdır.';
                        }
                      },
                      onSaved: (value) {
                        c.password.value = value!.trim();
                        print(c.password.value);
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 55, left: 16, right: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        _formKey.currentState!.save();
                        c.submit(context: context, formKey: _formKey);
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
                        "Login",
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

            /*                      ekleme yapıalcak alan                 */
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 420, left: 98, right: 97),
              child: Row(
                children: [
                  Container(
                    child: Text(
                      "Don't have an account?",
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
                        context.pushNamed(RouteName.signup_screen);
                      },
                      child: Text(
                        "Sign up",
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
              width: double.infinity,
              margin: EdgeInsets.only(top: 460, left: 41, right: 42),
              child: Row(
                children: [
                  Container(
                    width: 128,
                    height: 1,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.highlight008,
                        width: 1,
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 21, left: 21),
                      child: Text("or", style: TextStyle(color: Colors.black)),
                    ),
                  ),
                  Container(
                    width: 128,
                    height: 1,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.highlight008,
                        width: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 504, left: 16, right: 16),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(361, 51),
                  backgroundColor: AppColors.primary09,
                  foregroundColor: AppColors.primary06,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(15),
                  ),
                ),
                child: Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 10,
                          top: 8,
                          left: 70,
                        ),
                        child: Container(
                          child: SvgPicture.asset(
                            "assets/images/apple_logo.svg",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 8,
                          top: 8,
                          left: 5,
                        ),
                        child: Text(
                          "Sign in with Apple",
                          style: TextStyle(
                            color: AppColors.highlight,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 576, left: 16, right: 16),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(361, 51),
                  backgroundColor: AppColors.primary09,
                  foregroundColor: AppColors.primary06,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(15),
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                        top: 8,
                        left: 65,
                      ),
                      child: Container(
                        child: SvgPicture.asset(
                          "assets/images/google_logo.svg",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 8,
                        top: 8,
                        left: 8,
                      ),
                      child: Text(
                        "Sign in with Google",
                        style: TextStyle(
                          color: AppColors.highlight,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
