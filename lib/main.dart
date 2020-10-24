import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/Language/Language.dart';
import 'package:sx_commerece/components/appbar/AppBarProvider.dart';
import 'package:sx_commerece/screens/OrderSuccess/OrderSuccessScreen.dart';
import 'package:sx_commerece/screens/splash/SplashScreen.dart';

Language language = Language();

void main() => runApp(EasyLocalization(
      child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AppbarProvider()),
          ],
          child: MyApp()),
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
          primarySwatch: Colors.blue, visualDensity: VisualDensity.adaptivePlatformDensity, fontFamily: 'Poppins'),
      home: SplashScreen(),
      //   home: SplashScreen(),
    );
  }
}

double mainHeight, mainWidth, paddingTop, paddingBottom;
