import 'package:flutter/material.dart';

class HomePageProvider with ChangeNotifier {
  BuildContext context;

  HomePageProvider();

  void setView(BuildContext context) => this.context = context;
}
