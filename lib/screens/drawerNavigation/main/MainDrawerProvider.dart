import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';

class MainDrawerProvider with ChangeNotifier{

  BuildContext context;
  MainDrawerProvider();
  void setView(BuildContext context) {
  this.context = context;
  }

  final drawerController = ZoomDrawerController();
  int currentPage = 0;

  void updatePage(index) {
    drawerController.toggle();
  }

  void toggleDrawer(index) {
    drawerController.toggle();
  }

}