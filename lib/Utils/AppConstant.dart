

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sx_commerece/screens/main.dart';

List<Map<String, String>> onBoardData = [
  {"text": language.sliderTextOne, "image": "assets/images/one.png"},
  {"text": language.sliderTextTwo, "image": "assets/images/two.png"},
  {"text": language.sliderTextThree, "image": "assets/images/three.png"},
];

const primaryColor = Color(0xFF2196F3);
const textColor = Color(0xFF979797);

 CustomToast (String msg) async {
   Fluttertoast.showToast(
       msg: "$msg",
       toastLength: Toast.LENGTH_SHORT,
       gravity: ToastGravity.CENTER,
       timeInSecForIosWeb: 1,
       backgroundColor: Colors.red,
       textColor: Colors.white,
       fontSize: 16.0
   );
}