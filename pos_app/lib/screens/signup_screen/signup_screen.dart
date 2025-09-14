import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:go_router/go_router.dart';
import 'package:pos_app/colors/app_colors.dart';
import 'package:pos_app/otp_screen/otp_screen_controller.dart';
import 'package:pos_app/router/route_name.dart';
import 'package:pos_app/router/router_page.dart';
import 'package:pos_app/screens/signup_screen/signup_screen_controller.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  SignupScreenController controller = SignupScreenController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: [
            Container(
              width: 83,
              height: 32,
              margin: EdgeInsets.only(top: 96, right: 135, left: 135),
              child: Text(
                "Sign up",
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
                    margin: EdgeInsets.only(top: 55, right: 16, left: 16),
                    child: TextFormField(
                      controller: TextEditingController(text: "denemeisim"),
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: "Username",
                        hintStyle: TextStyle(
                          color: AppColors.primary03,
                          fontSize: 14,
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SvgPicture.asset(
                            "assets/images/profile-circle.svg",
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
                      onSaved: (newValue) {
                        print(controller.userName.value);
                        controller.userName.value = newValue!;
                        print(controller.userName.value);
                      },
                      validator: (value) {
                        if (value!.isEmpty || value.trim().isEmpty) {
                          return 'Kullanıcı ismi boş olamaz';
                        } else if (value.length < 6) {
                          return 'Kullanıcı ismi 6 karakterden kısa olamaz';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16, right: 16, left: 16),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: TextEditingController(
                        text: "cemilyyildirim@gmail.com",
                      ),
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(
                          color: AppColors.primary03,
                          fontSize: 14,
                        ),
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
                        if (value == null || value.trim().isEmpty) {
                          return 'Email con not be empty';
                        } else if (!value.contains("@") ||
                            !value.contains(".")) {
                          return 'İnvalid email adress';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (newValue) {
                        controller.email.value = newValue!;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16, right: 16, left: 16),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        helperText: "Not required",
                        helperStyle: TextStyle(color: Colors.amber),
                        hintText: "Phone number",
                        hintStyle: TextStyle(
                          color: AppColors.primary03,
                          fontSize: 14,
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SvgPicture.asset(
                            "assets/images/phone.fill.svg",
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
                        if (value == null || value.trim().isEmpty) {
                          return null;
                        } else if (value.length != 12) {
                          return "Phone number con not be under 12 number for Türkiye";
                        }
                      },
                      onSaved: (newValue) {
                        controller.phone.value = newValue!;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16, right: 16, left: 16),
                    child: TextFormField(
                      obscureText: true,
                      controller: TextEditingController(text: "123456"),
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: AppColors.primary03,
                          fontSize: 14,
                        ),
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
                        if (value == null || value.trim().isEmpty) {
                          return "Password can not be empty";
                        } else if (value.length < 6) {
                          return 'Password con not be under 6 chacacter';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (newValue) {
                        controller.password.value = newValue!;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16, right: 16, left: 16),
                    child: TextFormField(
                      obscureText: true,
                      controller: TextEditingController(text: "123456"),

                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        hintStyle: TextStyle(
                          color: AppColors.primary03,
                          fontSize: 14,
                        ),
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
                        if (value == null || value.trim().isEmpty) {
                          return "Password can not be empty";
                        } else if (value.length < 6) {
                          return 'Password con not be under 6 chacacter';
                        } else if (value != controller.password.value) {
                          return "Passwords doesnt match";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 51, left: 16, right: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        /* context.pushNamed(RouteName.verification_screen); */
                        _formKey.currentState!.save();
                        controller.submit(_formKey, context);
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
                        "Create Account",
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
              margin: EdgeInsets.only(top: 16, left: 95, right: 95),
              child: Row(
                children: [
                  Container(
                    child: Text(
                      "Already have an account?",
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
                        context.pushNamed(RouteName.login_screen);
                      },
                      child: Text(
                        "Log in",
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
          ],
        ),
      ),
    );
  }
}
