import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/Dimension/Dimension.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/components/Loading_Button.dart';
import 'package:sx_commerece/components/RoundedTextFormFIeld.dart';
import 'package:sx_commerece/provider/ForgotProvider.dart';
import 'package:sx_commerece/screens/main.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  ForgotProvider forgotProvider;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ForgotProvider>(
      create: (_) => ForgotProvider()..setView(context),
      child: Consumer<ForgotProvider>(builder: (context, model, child) {
        forgotProvider = model;
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(language.letUsHelp,
                    style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22)),
                Image.asset('assets/images/forgot_icon.jpg',
                    height: 350, width: 350),
                RoundedTextFormField(
                  hints: language.email,
                  onChanged: (value) {},
                  prefix: Icon(
                    Icons.email,
                    color: primaryColor,
                  ),
                ),
                SizedBox(height: 20),
                LoadingButton(
                  isLoading: forgotProvider.loading,
                  defaultStyle: true,
                  onPressed: () {
                    forgotProvider.goToResetPage();
                  },
                  backgroundColor: primaryColor,
                  child: Container(
                      height: 30,
                      width: mainWidth - 20 - (Dimension.Padding * 2),
                      alignment: Alignment.center,
                      child: Text(
                        language.submit,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Dimension.Text_Size_Big,
                            fontWeight: Dimension.boldText),
                      )),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
