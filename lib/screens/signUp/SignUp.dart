import 'package:flutter/material.dart';
import 'package:sx_commerece/Dimension/Dimension.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/components/CustomBackground2.dart';
import 'package:sx_commerece/components/Loading_Button.dart';
import 'package:sx_commerece/components/PasswordTextFieldWithShadow.dart';
import 'package:sx_commerece/components/TextFieldWithShadow.dart';
import 'package:sx_commerece/main.dart';
import 'package:sx_commerece/screens/login/Login.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/screens/signUp/SignUpProvider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  SignUpProvider signUpProvider;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<SignUpProvider>(
      create: (_) => SignUpProvider()..setView(context),
      child: Consumer<SignUpProvider>(builder: (context, model, child) {
        signUpProvider = model;

        return Scaffold(
          backgroundColor: Colors.white,
          body: CustomBackground2(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * .25),
                  Row(
                    children: [
                      SizedBox(width: 15),
                      Text(language.letsStartSignUp,
                          style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 22)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: size.height * 0.56,
                    width: size.width * .9,
                    decoration: BoxDecoration(
                        color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: primaryShadow),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextFieldWithShadow(
                              hintText: language.email,
                              controller: null,
                            ),
                            SizedBox(height: 10),
                            PasswordTextFieldWithShadow(
                              hintText: language.password,
                              controller: null,
                            ),
                            SizedBox(height: 10),
                            PasswordTextFieldWithShadow(
                              hintText: language.confirmPassword,
                              controller: null,
                            ),
                            SizedBox(height: 10),
                            LoadingButton(
                              isLoading: signUpProvider.loading,
                              defaultStyle: true,
                              onPressed: () {
                                signUpProvider.goToMainPage();
                              },
                              backgroundColor: primaryColor,
                              child: Container(
                                  height: 30,
                                  width: mainWidth - 20 - (Dimension.padding * 2),
                                  alignment: Alignment.center,
                                  child: Text(
                                    language.login,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Dimension.textSizeBig,
                                        fontWeight: Dimension.boldText),
                                  )),
                            ),
                            SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                              },
                              child: Text(
                                language.alreadyHaveAnAccount,
                                style: TextStyle(
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
