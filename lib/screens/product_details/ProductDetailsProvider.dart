import 'package:flutter/material.dart';

class ProductDetailsProvider with ChangeNotifier{

  BuildContext context;
  ProductDetailsProvider();
  void setView(BuildContext context) => this.context = context;

}