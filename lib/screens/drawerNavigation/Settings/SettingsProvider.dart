import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier{

  BuildContext context;
  SettingsProvider();
  void setView(BuildContext context) => this.context = context;

}