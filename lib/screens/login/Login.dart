import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/components/RoundedPasswordTextFormField.dart';
import 'package:sx_commerece/components/RoundedTextFormFIeld.dart';
import 'package:sx_commerece/components/RoundedButton.dart';
import 'package:sx_commerece/screens/main.dart';
import 'package:sx_commerece/screens/main_screen/MainScreen.dart';
import 'package:sx_commerece/screens/signUp/SignUp.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(language.letsStart,
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22)),
            Image.asset('assets/images/login.png', height: 200, width: 200),
            RoundedTextFormField(
              hints: language.email,
              onChanged: (value) {},
            ),
            SizedBox(height: 20),
            RoundedPasswordTextFormField(
                hint: language.password,
                onChanged: (value) {}
                ),
            SizedBox(height: 20),
            RoundedButton(text: language.login, press: () {
              CustomToast('login done');
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
            }),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));},
              child: Text("Don't have account? Sign Up", style: TextStyle(color: primaryColor,),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));},
              child: Text(language.forgotPassword, style: TextStyle(color: primaryColor,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
