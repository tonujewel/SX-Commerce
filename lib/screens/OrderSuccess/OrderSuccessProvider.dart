import 'package:flutter/material.dart';

class OrderSuccessProvider with ChangeNotifier{

  BuildContext context;

  OrderSuccessProvider();


  void setView(BuildContext context) => this.context = context;
}