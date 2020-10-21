import 'package:flutter/material.dart';
import 'package:sx_commerece/screens/Checkout/CheckoutScreen.dart';

class CartProvider with ChangeNotifier {
  BuildContext context;

  CartProvider();

  void setView(BuildContext context) => this.context = context;

  TextEditingController promoCodeController = TextEditingController();

  void goToCheckoutPage(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckoutScreen()));
  }
}
