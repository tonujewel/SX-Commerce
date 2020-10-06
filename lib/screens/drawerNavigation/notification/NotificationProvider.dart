import 'package:flutter/material.dart';

class NotificationProvider with ChangeNotifier{

  BuildContext context;
  NotificationProvider();
  void setView(BuildContext context) => this.context = context;

}