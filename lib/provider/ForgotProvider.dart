import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sx_commerece/screens/OTP_screen/OTPScreen.dart';

class ForgotProvider with ChangeNotifier{

  BuildContext context;
  ForgotProvider();
  bool loading = false;
  void setView(BuildContext context) => this.context = context;

  void goToResetPage() {
    loading = true;
    notifyListeners();
    Timer(Duration(seconds: 2), () {
      loading = false;
      notifyListeners();
      Navigator.push(context, MaterialPageRoute(builder: (context)=>OTPScreen()));
    });
  }

}