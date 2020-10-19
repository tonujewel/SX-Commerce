import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier{

  BuildContext context;

  CartProvider();

  void setView(BuildContext context) => this.context = context;
}