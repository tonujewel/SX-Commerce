import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sx_commerece/screens/login/Login.dart';

class ResetProvider with ChangeNotifier {
  BuildContext context;

  ResetProvider();

  void setView(BuildContext context) => this.context = context;

  bool loading = false;

  void goToLoginPage() {
    loading = true;
    notifyListeners();
    Timer(Duration(seconds: 2), () {
      loading = false;
      notifyListeners();
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }
}
