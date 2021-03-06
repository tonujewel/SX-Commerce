import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sx_commerece/components/Animation/FadeAnimation.dart';
import 'package:sx_commerece/components/CustomBackground2.dart';
import 'package:sx_commerece/screens/onBoard/OnBoard.dart';
import '../../main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context) => OnBoard()), (Route<dynamic> route) => false));
  }

  @override
  Widget build(BuildContext context) {
    mainHeight = MediaQuery.of(context).size.height;
    mainWidth = MediaQuery.of(context).size.width;
    paddingTop = MediaQuery.of(context).padding.top;
    paddingBottom = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomBackground2(
        child: Center(
          child: FadeAnimation(2, imageColumn()),
        ),
      ),
    );
  }

  Column imageColumn() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/logo.jpg'),
        ],
      );
  }
}
