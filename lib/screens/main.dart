import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sx_commerece/Language/Language.dart';
import 'package:sx_commerece/screens/bottomNavigation/home/HomeScreen.dart';
import 'package:sx_commerece/screens/product_details/ProductDetailsScreen.dart';
import 'package:sx_commerece/screens/splash/SplashScreen.dart';

Language language = Language();


void main() => runApp(EasyLocalization(
  child: MyApp(),
  path: 'assets/langs',
  supportedLocales: MyApp.list,
  useOnlyLangCode: true,
));

class MyApp extends StatelessWidget {

  static const list = [
    Locale('en', 'US'),
    Locale('ar', 'TN'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SofX E-commerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Raleway'),
          home: SplashScreen(),
      //    home: ProductDetailsScreen(),
    );
  }
}

double mainHeight, mainWidth, paddingTop, paddingBottom;

