import 'package:flutter/material.dart';
import 'package:sx_commerece/screens/OrderSuccess/OrderSuccessScreen.dart';

class CheckoutProvider with ChangeNotifier{
  BuildContext context;
  CheckoutProvider();
  void setView(BuildContext context) => this.context = context;

  void backPress(){
    Navigator.pop(context);
  }

  void goToOrderSuccessScreen(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> OrderSuccessScreen()));
  }
}