import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sx_commerece/screens/signUp/SignUp.dart';

class LoginProvider with ChangeNotifier {
  BuildContext context;
  bool loading = false;

  LoginProvider();

  void setView(BuildContext context) => this.context = context;

  void goTOSignUpScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
    notifyListeners();
  }

  void goToMainPage() {
    loading = true;
    notifyListeners();
    Timer(Duration(seconds: 2), () {
      loading = false;
      notifyListeners();
      //
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(builder: (context) => MainScreen()),
      //     (Route<dynamic> route) => false);
    });
  }
}
