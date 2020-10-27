import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/Language/Language.dart';
import 'package:sx_commerece/components/appbar/AppBarProvider.dart';
import 'package:sx_commerece/screens/splash/SplashScreen.dart';

Language language = Language();

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => AppbarProvider()),
    ], child: MyApp()));

class MyApp extends StatelessWidget {
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

