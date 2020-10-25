import 'package:flutter/material.dart';
import 'package:sx_commerece/screens/Checkout/CheckoutScreen.dart';
import 'package:sx_commerece/screens/cart/CartScreen.dart';


class ProductDetailsProvider with ChangeNotifier {
  BuildContext context;
  bool loading = false;
  ProductDetailsProvider();
  void setView(BuildContext context) => this.context = context;

  void backPress(){
    Navigator.pop(context);
  }
  void buyNowAction() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutScreen()));
  }

  void addCartAction() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
  }
}
