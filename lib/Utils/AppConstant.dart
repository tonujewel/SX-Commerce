import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sx_commerece/screens/main.dart';

// On board slider
List<Map<String, String>> onBoardData = [
  {"text": language.sliderTextOne, "image": "assets/images/one.png"},
  {"text": language.sliderTextTwo, "image": "assets/images/two.png"},
  {"text": language.sliderTextThree, "image": "assets/images/three.png"},
];

const primaryColor = Color(0xFF2196F3);
const textColor = Color(0xFF979797);
const titleTextColor = Color(0xFF2196F3);
const drawerSelected = Color(0xFF64B5F6);

// shadow
List<BoxShadow> shadow = [
  BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10))
];

List<BoxShadow> primaryShadow = [
  BoxShadow(color: Colors.blue[100], blurRadius: 30, offset: Offset(0, 10))
];
// carousel home page
List<Map> categories = [
  {"name": language.sliderTextOne, "image": "assets/images/one.png"},
  {"name": language.sliderTextTwo, "image": "assets/images/two.png"},
  {"name": language.sliderTextThree, "image": "assets/images/three.png"},
];

// navigation drawer items
 List<MenuItem> mainMenu = [
  MenuItem(tr("home"), Icons.home, 0),
  MenuItem(tr("settings"), Icons.settings, 1),
  MenuItem(tr("notifications"), Icons.notifications, 2),
  MenuItem(tr("help"), Icons.help, 3),
  MenuItem(tr("about_us"), Icons.info_outline, 4),
];

class MenuItem {
  final String title;
  final IconData icon;
  final int index;
  const MenuItem(this.title, this.icon, this.index);
}

void showToast(String msg){
  Fluttertoast.showToast(
      msg: "$msg",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: primaryColor,
      textColor: Colors.white,
      fontSize: 16.0
  );

}


