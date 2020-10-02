import 'package:flutter/material.dart';
import 'package:sx_commerece/screens/signUp/SignUp.dart';


class LoginProvider with ChangeNotifier{
  BuildContext context;

  LoginProvider();
  void setView(BuildContext context) => this.context = context;

  void goTOSignUpScreen(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
    notifyListeners();
  }
}