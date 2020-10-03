import 'package:flutter/material.dart';
import 'package:sx_commerece/Dimension/Dimension.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/components/Loading_Button.dart';
import 'package:sx_commerece/components/RoundedButton.dart';
import 'package:sx_commerece/components/RoundedPasswordTextFormField.dart';
import 'package:sx_commerece/components/RoundedTextFormFIeld.dart';
import 'package:sx_commerece/provider/LoginProvider.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/screens/main_screen/MainScreen.dart';
import 'package:sx_commerece/screens/signUp/SignUp.dart';
import '../main.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginProvider loginProvider;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginProvider>(
      create: (_) =>LoginProvider()..setView(context) ,
      child: Consumer<LoginProvider>(
        builder: (context,model,child){
          loginProvider=model;
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
                    prefix: Icon(Icons.email,color: primaryColor,),
                  ),
                  SizedBox(height: 20),
                  RoundedPasswordTextFormField(
                      hint: language.password,
                      onChanged: (value) {},
                    prefixIcon: Icon(Icons.lock,color: primaryColor,),
                  ),
                  SizedBox(height: 20),
                  LoadingButton(
                    isLoading: loginProvider.loading,
                    defaultStyle: true,
                    onPressed: () {
                     loginProvider.goToMainPage();
                    },
                    backgroundColor: primaryColor,
                    child: Container(
                        width: mainWidth-20-(Dimension.Padding*2),
                        alignment: Alignment.center,
                        child: Text(language.login,style: TextStyle(color: Colors.white,fontSize: Dimension.Text_Size_Big,fontWeight: Dimension.boldText),)
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {loginProvider.goTOSignUpScreen();},
                    child: Text(language.doNotHaveAccount, style: TextStyle(color: primaryColor,),
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
        },
      ),
    );
  }
}
