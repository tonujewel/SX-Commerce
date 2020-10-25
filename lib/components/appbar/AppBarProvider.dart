import 'package:flutter/material.dart';
import 'package:sx_commerece/screens/ProfileAllscreens/notification/NotificationScreen.dart';
import 'package:sx_commerece/screens/cart/CartScreen.dart';

class AppbarProvider with ChangeNotifier {
  BuildContext context;

  AppbarProvider();

  void setView(BuildContext context) => this.context = context;
  int counter = 0;

  void incrementCounter() {
    counter = 5;
    notifyListeners();
  }

  void goToCartPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
  }

  void goNotificationPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
  }
}
