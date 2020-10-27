import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/Dimension/Dimension.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/components/CustomBackground2.dart';
import 'package:sx_commerece/components/Loading_Button.dart';
import 'package:sx_commerece/components/TextFieldWithShadow.dart';
import 'package:sx_commerece/main.dart';
import 'package:sx_commerece/Utils/mColor.dart';
import 'package:sx_commerece/screens/forgot_password/ForgotProvider.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  ForgotProvider forgotProvider;

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<ForgotProvider>(
      create: (_) => ForgotProvider()..setView(context),
      child: Consumer<ForgotProvider>(
        builder: (context, model, child) {
          forgotProvider = model;
          return Scaffold(
            body: CustomBackground2(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: size.height * .25),
                    Row(
                      children: [
                        SizedBox(width: 15),
                        Text(language.forgotPassword,
                            style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 22)),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: size.height * 0.42,
                      width: size.width * .9,
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: shadow),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFieldWithShadow(
                              hintText: language.email,
                              controller: emailController,
                            ),
                            SizedBox(height: 30),
                            LoadingButton(
                              isLoading: forgotProvider.loading,
                              defaultStyle: true,
                              onPressed: () {
                                forgotProvider.goToResetPage();
                              },
                              backgroundColor: primaryColor,
                              child: Container(
                                height: 30,
                                width: mainWidth - 20 - (Dimension.padding * 2),
                                alignment: Alignment.center,
                                child: Text(
                                  language.submit,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimension.textSizeBig,
                                      fontWeight: Dimension.boldText),
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
