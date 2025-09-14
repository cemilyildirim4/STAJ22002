
import 'package:flutter/material.dart';
import 'package:world_clock_case/colors/colors.dart';


class AppSettings {
  static bool darkBool = true;

  static Color get backgroundColor =>
      darkBool ? AppColors.dark : AppColors.white;

  static Color get fontColor =>
      darkBool ? AppColors.white : AppColors.dark;

  static Color get appBarColor =>
      darkBool ? AppColors.dark2 : AppColors.lightBlue;

  static Color get iconColor =>
      darkBool ? AppColors.white : AppColors.dark;

  static String get star =>
      darkBool ? "assets/svgs/Star.svg" : "assets/svgs/Star-light.svg";
}