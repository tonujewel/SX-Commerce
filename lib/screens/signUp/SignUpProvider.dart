import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sx_commerece/screens/drawerNavigation/main/MainDrawerScreen.dart';
import 'package:sx_commerece/screens/forgot_password/ForgotPassword.dart';
import 'package:sx_commerece/screens/signUp/SignUp.dart';

class SignUpProvider with ChangeNotifier {
  BuildContext context;
  bool loading = false;

  SignUpProvider();

  void setView(BuildContext context) => this.context = context;

  void goTOLoginScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }

  void goToMainPage() {
    loading = true;
    notifyListeners();
    Timer(Duration(seconds: 2), () {
      loading = false;
      notifyListeners();
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => MainDrawerScreen()), (Route<dynamic> route) => false);
    });
  }
}
