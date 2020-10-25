import 'package:flutter/material.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';

class NotificationProvider with ChangeNotifier {
  BuildContext context;

  NotificationProvider();

  void setView(BuildContext context) => this.context = context;

  void backPress() {
    Navigator.pop(context);
  }

  int currentIndex;

  void listOnClick() {
    showToast("Clicked on : $currentIndex");
  }
}
