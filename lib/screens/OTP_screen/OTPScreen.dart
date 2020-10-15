import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/Dimension/Dimension.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/components/Loading_Button.dart';
import 'file:///D:/SoftX/Flutter%20project/sx_commerece/sx_commerece/lib/screens/OTP_screen/OTPProvider.dart';
import 'file:///D:/SoftX/Flutter%20project/sx_commerece/sx_commerece/lib/main.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  OTPProvider otpProvider;
  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController();

  // ..text = "123456";

  StreamController<ErrorAnimationType> errorController;
  String currentText = "";
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OTPProvider>(
      create: (_) => OTPProvider()..setView(context),
      child: Consumer<OTPProvider>(builder: (context, model, child) {
        otpProvider = model;
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/reset.png', height: 200, width: 200),
                Text(language.verificationCode, style: TextStyle(color: titleTextColor, fontSize: 26,fontWeight: FontWeight.bold)),
                SizedBox(height: 6,),
                Text("${language.sentTo} +880123456789"),
                SizedBox(height: 20,),
                PinCodeTextField(
                  appContext: context,
                  pastedTextStyle: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 4,
                  // obscureText: true,
                  // obscuringCharacter: '?',
                  animationType: AnimationType.fade,
                  validator: (v) {
                    if (v.length < 3) {
                      return "I'm from validator";
                    } else {
                      return null;
                    }
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.underline,
                    borderRadius: BorderRadius.circular(15),
                    fieldHeight: 40,
                    fieldWidth: 40,
                    inactiveColor: Colors.blueGrey,
                    activeColor: primaryColor,
                    activeFillColor: hasError ? Colors.blueGrey : Colors.white,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  //  backgroundColor: Colors.blue.shade50,
                  enableActiveFill: false,
                  errorAnimationController: errorController,
                  controller: textEditingController,
                  keyboardType: TextInputType.number,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                ),
                SizedBox(height: 20,),
                LoadingButton(
                  isLoading: otpProvider.loading,
                  defaultStyle: true,
                  onPressed: () {
                    otpProvider.goToResetPage();
                  },
                  backgroundColor: primaryColor,
                  child: Container(
                      height: 30,
                      width: mainWidth-20-(Dimension.Padding*2),
                      alignment: Alignment.center,
                      child: Text(language.submit,style: TextStyle(color: Colors.white,fontSize: Dimension.Text_Size_Big,fontWeight: Dimension.boldText),)
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
