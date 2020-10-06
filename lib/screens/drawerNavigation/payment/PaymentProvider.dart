import 'package:flutter/material.dart';

class PaymentProvider with ChangeNotifier{

  BuildContext context;
  PaymentProvider();
  void setView(BuildContext context) => this.context = context;

}