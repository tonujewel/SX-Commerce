import 'package:flutter/material.dart';

class CheckoutProvider with ChangeNotifier{
  BuildContext context;
  CheckoutProvider();
  void setView(BuildContext context) => this.context = context;

  void backPress(){
    Navigator.pop(context);
  }

}