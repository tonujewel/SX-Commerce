import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/components/RoundedPasswordTextFormField.dart';
import 'package:sx_commerece/components/RoundedTextFormFIeld.dart';
import 'package:sx_commerece/components/rounded_button.dart';
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
            Text("Let's Enter",
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22)),
            Image.asset('assets/images/login.png', height: 200, width: 200),
            RoundedTextFormField(
              hints: 'Email',
              onChanged: (value) {},
            ),
            SizedBox(height: 20),
            RoundedPasswordTextFormField(
                hint: "Password",
                onChanged: (value) {}
                ),
            SizedBox(height: 20),
            RoundedButton(text: "Login", press: () {}),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));},
              child: Text("Don't have account? Sign Up", style: TextStyle(color: primaryColor,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
