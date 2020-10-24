import 'package:flutter/material.dart';
import 'package:sx_commerece/screens/DeliveryStatus/DeliveryStatus.dart';

class OrderSuccessProvider with ChangeNotifier{

  BuildContext context;

  OrderSuccessProvider();

  void setView(BuildContext context) => this.context = context;

  void goToOrderStatusScreen(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>DeliveryStatusScreen()));
  }
}