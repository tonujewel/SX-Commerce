import 'package:flutter/material.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/components/RoundedPasswordTextFormField.dart';
import 'package:sx_commerece/components/RoundedTextFormFIeld.dart';
import 'package:sx_commerece/components/rounded_button.dart';
import 'package:sx_commerece/screens/home/home_screen.dart';

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
                Text("Let's Enter",
                    style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22)),
                Image.asset('assets/images/sign_up.png', height: 200, width: 200),
                RoundedTextFormField(
                  hints: 'Name',
                  onChanged: (value) {},
                ),
                SizedBox(height: 15),
                RoundedTextFormField(
                  hints: 'Email',
                  onChanged: (value) {},
                ),
                SizedBox(height: 15),
                RoundedPasswordTextFormField(
                    hint: "Password",
                    onChanged: (value) {

                    }
                    ),
                SizedBox(height: 20),
                RoundedButton(text: "Sign Up", press: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));}),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));},
                  child: Text("Don't have account? Sign Up", style: TextStyle(color: primaryColor,),
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
