import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sx_commerece/screens/forgot_password/ForgotPassword.dart';
import 'package:sx_commerece/screens/main_screen/MainScreen.dart';
import 'package:sx_commerece/screens/signUp/SignUp.dart';

class LoginProvider with ChangeNotifier {
  BuildContext context;
  bool loading = false;

  LoginProvider();

  void setView(BuildContext context) => this.context = context;

  void goTOSignUpScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }

  void goToForgotScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
  }

  void goToMainPage() {
    loading = true;
    notifyListeners();
    Timer(Duration(seconds: 2), () {
      loading = false;
      notifyListeners();
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => MainScreen()), (Route<dynamic> route) => false);
    });
  }
}
