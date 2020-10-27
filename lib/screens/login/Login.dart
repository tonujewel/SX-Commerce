import 'package:flutter/material.dart';
import 'package:sx_commerece/Dimension/Dimension.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/components/CustomBackground2.dart';
import 'package:sx_commerece/components/Loading_Button.dart';
import 'package:sx_commerece/components/PasswordTextFieldWithShadow.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/components/TextFieldWithShadow.dart';
import 'package:sx_commerece/main.dart';
import 'package:sx_commerece/screens/login/LoginProvider.dart';
import 'package:sx_commerece/Utils/mColor.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginProvider loginProvider;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<LoginProvider>(
      create: (_) => LoginProvider()..setView(context),
      child: Consumer<LoginProvider>(
        builder: (context, model, child) {
          loginProvider = model;
          return Scaffold(
            body: CustomBackground2(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: size.height * .25),
                    Row(
                      children: [
                        SizedBox(width: 15),
                        Text(language.letsStart,
                            style: TextStyle(color:textColor, fontWeight: FontWeight.bold, fontSize: 22)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: size.height * 0.52,
                      width: size.width * .9,
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: primaryShadow),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextFieldWithShadow(
                              hintText: language.email,
                              controller: emailController,
                            ),
                            SizedBox(height: 10),
                            PasswordTextFieldWithShadow(
                              hintText: language.password,
                              controller: passwordController,
                            ),
                            SizedBox(height: 10),
                            LoadingButton(
                              isLoading: loginProvider.loading,
                              defaultStyle: true,
                              onPressed: () {
                                loginProvider.goToMainPage();
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
                                loginProvider.goTOSignUpScreen();
                              },
                              child: Text(
                                language.doNotHaveAccount,
                                style: TextStyle(
                                  color: primaryColor,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                loginProvider.goToForgotScreen();
                              },
                              child: Text(
                                language.forgotPassword,
                                style: TextStyle(
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
