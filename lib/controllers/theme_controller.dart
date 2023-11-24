import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateThemeController extends GetxController {
  var isDarkMode = false.obs;

  void mychangeTheme(bool isDark) {
    isDarkMode.value = isDark;
    print("Theme Mode value : $isDarkMode");

    if (isDarkMode.value == false) {
      Get.changeTheme(ThemeData.light());
    }
    if (isDarkMode.value == true) {
      Get.changeTheme(ThemeData.dark());
    }
  }
}
