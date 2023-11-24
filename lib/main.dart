import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_utilities_tutorial/screens/firstscreen.dart';
import 'package:getx_utilities_tutorial/screens/homescreen.dart';
import 'package:getx_utilities_tutorial/utils/languages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Getx_Utilities',
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () =>  HomeScreen(),
        ),
        GetPage(
          name: '/FirstScreen',
          page: () => const FirstScreen(),
        ),
      ],
      fallbackLocale: const Locale('english','US'),
      translations: Language(),
      locale:const Locale('english','US'),
      
    ),
  );
}
