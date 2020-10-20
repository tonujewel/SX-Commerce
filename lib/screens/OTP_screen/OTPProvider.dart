import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sx_commerece/screens/reset_screen/ResetScreen.dart';

class OTPProvider with ChangeNotifier {
  BuildContext context;

  OTPProvider();

  void setView(BuildContext context) => this.context = context;

  bool loading = false;

  void goToResetPage() {
    loading = true;
    notifyListeners();
    Timer(Duration(seconds: 2), () {
      loading = false;
      notifyListeners();
      Navigator.push(context, MaterialPageRoute(builder: (context) => ResetScreen()));
    });
  }
}
