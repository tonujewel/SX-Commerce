import 'package:flutter/material.dart';

class MenuProvider with ChangeNotifier{

  BuildContext context;
  MenuProvider();
  void setView(BuildContext context) => this.context = context;

  int _currentPage = 0;

  int get currentPage => _currentPage;

  void updateCurrentPage(int index) {
    if (index != currentPage) {
      _currentPage = index;
      notifyListeners();
    }
  }

}