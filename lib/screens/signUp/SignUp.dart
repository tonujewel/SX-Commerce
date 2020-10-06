import 'package:flutter/material.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/components/RoundedPasswordTextFormField.dart';
import 'package:sx_commerece/components/RoundedTextFormFIeld.dart';
import 'package:sx_commerece/components/RoundedButton.dart';
import 'package:sx_commerece/screens/bottomNavigation/home/HomeScreen.dart';
import 'package:sx_commerece/screens/login/Login.dart';
import 'package:sx_commerece/screens/main.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 50,),
                Text(language.letsStart,
                    style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22)),
                Image.asset('assets/images/sign_up.png', height: 200, width: 200),
                RoundedTextFormField(
                  hints: language.name,
                  onChanged: (value) {},
                ),
                SizedBox(height: 15),
                RoundedTextFormField(
                  hints: language.email,
                  onChanged: (value) {},
                ),
                SizedBox(height: 15),
                RoundedPasswordTextFormField(
                    hint: language.password,
                    onChanged: (value) {
                    }
                    ),
                SizedBox(height: 20),
                RoundedButton(text:language.signUp, press: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));}),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));},
                  child: Text(language.alreadyHaveAnAccount, style: TextStyle(color: primaryColor,),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
