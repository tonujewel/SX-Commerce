import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/screens/drawerNavigation/main/MainDrawerProvider.dart';

class SettingsProvider with ChangeNotifier{

  BuildContext context;
  SettingsProvider();
  void setView(BuildContext context) => this.context = context;

  void backPress(){
    Navigator.pop(context);
  }

}