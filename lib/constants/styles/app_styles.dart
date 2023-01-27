import 'package:dovie/constants/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppStyles {
  TextStyle headingText = const TextStyle(
      fontFamily: 'Fredoka',
      fontWeight: FontWeight.w600,
      color: AppColors.greenColor,
      fontSize: 30);
  TextStyle mediumText = const TextStyle(
      fontFamily: 'Marykate',
      fontWeight: FontWeight.w400,
      color: AppColors.greenColor,
      fontSize: 30);
  TextStyle smallText = const TextStyle(
      fontFamily: 'Marykate',
      fontWeight: FontWeight.w400,
      color: AppColors.greenColor,
      fontSize: 24);
}

class ScreenSize {
  static getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static getScreenHeight() {
    return Get.height;
  }

  static getScreenWidth() {
    return Get.width;
  }

  static getHeight(double pixels) {
    double x = getScreenHeight() / pixels;
    return getScreenHeight() / x;
  }

  static getWidth(double pixels) {
    double x = getScreenWidth() / pixels;
    return getScreenWidth() / x;
  }
}
