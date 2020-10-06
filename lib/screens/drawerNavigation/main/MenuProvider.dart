import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/screens/drawerNavigation/Settings/SettingsScreen.dart';
import 'package:sx_commerece/screens/drawerNavigation/about_us/AboutScreen.dart';
import 'package:sx_commerece/screens/drawerNavigation/help/HelpScreen.dart';
import 'file:///D:/SoftX/Flutter%20project/sx_commerece/sx_commerece/lib/screens/drawerNavigation/main/MainDrawerProvider.dart';
import 'package:sx_commerece/screens/drawerNavigation/notification/NotificationScreen.dart';

class MenuProvider with ChangeNotifier {
  BuildContext context;

  MenuProvider();

  void setView(BuildContext context) => this.context = context;

  int _currentPage = 0;
  int newCurrentPage = 0;

  int get currentPage => _currentPage;

  void updateCurrentPage(int index) {
    if (index != currentPage) {
      _currentPage = index;
      notifyListeners();
    }
  }

  void drawerNavigation() {
    if (newCurrentPage == 0) {
      Provider.of<MainDrawerProvider>(context, listen: false).toggleDrawer(newCurrentPage);
      notifyListeners();
    }  else if (newCurrentPage == 1) {
      nextPage(SettingsScreen());
    } else if (newCurrentPage == 2) {
      nextPage(NotificationScreen());
    } else if (newCurrentPage == 3) {
      nextPage(HelpScreen());
    }else if (newCurrentPage == 4) {
      nextPage(AboutScreen());
    }
  }

  void nextPage(Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
    Provider.of<MainDrawerProvider>(context, listen: false)
        .toggleDrawer(newCurrentPage);
    notifyListeners();
  }
}
