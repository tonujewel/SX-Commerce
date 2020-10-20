import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/Dimension/Dimension.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/components/CustomBackground.dart';
import 'package:sx_commerece/components/Loading_Button.dart';
import 'package:sx_commerece/components/PasswordTextFieldWithShadow.dart';
import 'package:sx_commerece/main.dart';
import 'package:sx_commerece/screens/reset_screen/ResetProvider.dart';

class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  ResetProvider resetProvider;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<ResetProvider>(
      create: (_) => ResetProvider()..setView(context),
      child: Consumer<ResetProvider>(builder: (context, model, child) {
        resetProvider = model;
        return Scaffold(
          backgroundColor: Colors.white,
          body: CustomBackground(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: size.height * .15),
                  Row(
                    children: [
                      SizedBox(width: 15),
                      Text(language.resetPassword,
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22)),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: size.height * 0.52,
                    width: size.width * .9,
                    decoration:
                        BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: shadow),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PasswordTextFieldWithShadow(
                              hintText: language.password,
                              controller: null,
                            ),
                            SizedBox(height: 20),
                            PasswordTextFieldWithShadow(
                              hintText: language.confirmPassword,
                              controller: null,
                            ),
                            SizedBox(height: 20),
                            LoadingButton(
                              isLoading: resetProvider.loading,
                              defaultStyle: true,
                              onPressed: () {
                                resetProvider.goToLoginPage();
                              },
                              backgroundColor: primaryColor,
                              child: Container(
                                  height: 30,
                                  width: mainWidth - 20 - (Dimension.padding * 2),
                                  alignment: Alignment.center,
                                  child: Text(
                                    language.reset,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Dimension.textSizeBig,
                                        fontWeight: Dimension.boldText),
                                  )),
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
