import 'package:flutter/material.dart';

class HelpProvider with ChangeNotifier{

  BuildContext context;
  HelpProvider();
  void setView(BuildContext context) => this.context = context;

}