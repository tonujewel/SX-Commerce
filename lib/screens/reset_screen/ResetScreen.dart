import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/Dimension/Dimension.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/components/Loading_Button.dart';
import 'package:sx_commerece/components/PasswordTextFieldWithShadow.dart';
import 'package:sx_commerece/components/RoundedPasswordTextFormField.dart';
import 'file:///D:/SoftX/Flutter%20project/sx_commerece/sx_commerece/lib/screens/reset_screen/ResetProvider.dart';
import 'package:sx_commerece/screens/main.dart';

class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  ResetProvider resetProvider;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ResetProvider>(
      create: (_) => ResetProvider()..setView(context),
      child: Consumer<ResetProvider>(builder: (context, model, child) {
        resetProvider = model;
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(language.resetPassword,
                    style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22)),
                Image.asset('assets/images/reset.png', height: 200, width: 200),
                SizedBox(height: 20),
                PasswordTextFieldWithShadow(hintText: language.password,controller: null,),
                SizedBox(height: 20),
                PasswordTextFieldWithShadow(hintText: language.confirmPassword,controller: null,),
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
                      width: mainWidth-20-(Dimension.Padding*2),
                      alignment: Alignment.center,
                      child: Text(language.reset,style: TextStyle(color: Colors.white,fontSize: Dimension.Text_Size_Big,fontWeight: Dimension.boldText),)
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
