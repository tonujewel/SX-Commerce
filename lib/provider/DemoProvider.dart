import 'package:flutter/material.dart';

class DemoProvider with ChangeNotifier{

  BuildContext context;
  DemoProvider();
  void setView(BuildContext context) => this.context = context;

}