import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/Dimension/Dimension.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/components/CustomBackground.dart';
import 'package:sx_commerece/components/Loading_Button.dart';
import 'package:sx_commerece/main.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'OTPProvider.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  OTPProvider otpProvider;
  var onTapRecognizer;

  TextEditingController _pinEditingController = TextEditingController(text: '123');

  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType> errorController;
  String currentText = "";
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<OTPProvider>(
      create: (_) => OTPProvider()..setView(context),
      child: Consumer<OTPProvider>(builder: (context, model, child) {
        otpProvider = model;
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
                      Text(language.enterOTP,
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22)),
                    ],
                  ),
                  Container(
                    height: size.height * 0.5,
                    width: size.width * .9,
                    decoration:
                        BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: shadow),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(language.verificationCode,
                              style: TextStyle(color: textColor, fontSize: 26, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            "${language.sentTo} +880123456789",
                            style: TextStyle(color: textColor),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: PinInputTextField(
                              pinLength: 4,
                              decoration: CirclePinDecoration(
                                strokeColorBuilder: PinListenColorBuilder(primaryColor, textColor),
                              ),
                              controller: _pinEditingController,
                              textInputAction: TextInputAction.go,
                              enabled: true,
                              keyboardType: TextInputType.number,
                              textCapitalization: TextCapitalization.characters,
                              onSubmit: (pin) {
                                debugPrint('submit pin:$pin');
                              },
                              onChanged: (pin) {
                                debugPrint('onChanged execute. pin:$pin');
                              },
                              enableInteractiveSelection: false,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          LoadingButton(
                            isLoading: otpProvider.loading,
                            defaultStyle: true,
                            onPressed: () {
                              otpProvider.goToResetPage();
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
                                )),
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
      }),
    );
  }
}
