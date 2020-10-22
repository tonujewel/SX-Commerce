import 'package:flutter/material.dart';

class DeliveryStatusProvider with ChangeNotifier{

  BuildContext context;
  DeliveryStatusProvider();
  void setView( BuildContext context) => this.context = context;
}