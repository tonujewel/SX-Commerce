import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sx_commerece/screens/main.dart';

List<Map<String, String>> onBoardData = [
  {"text": language.sliderTextOne, "image": "assets/images/one.png"},
  {"text": language.sliderTextTwo, "image": "assets/images/two.png"},
  {"text": language.sliderTextThree, "image": "assets/images/three.png"},
];

const primaryColor = Color(0xFF2196F3);
const textColor = Color(0xFF979797);
const titleTextColor = Color(0xFF2196F3);

List<BoxShadow> showlist = [
  BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10))
];

List<Map> categories = [
  {"name": language.sliderTextOne, "image": "assets/images/one.png"},
  {"name": language.sliderTextTwo, "image": "assets/images/two.png"},
  {"name": language.sliderTextThree, "image": "assets/images/three.png"},
];
