import 'package:flutter/material.dart';
import 'package:sx_commerece/screens/login/Login.dart';
import 'package:sx_commerece/screens/signUp/SignUp.dart';

class OnBoardProvider with ChangeNotifier {
  OnBoardProvider();

  BuildContext context;
  int currentPage = 0;

  void setView(BuildContext context) => this.context = context;

  gotoLoginPage(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  goToSignUpPage(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }






}
