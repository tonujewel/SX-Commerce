import 'package:flutter/material.dart';

class AllCategoriesProvider with ChangeNotifier {
  BuildContext context;

  AllCategoriesProvider();

  void setView(BuildContext context) => this.context = context;

  backPress(){
    Navigator.pop(context);
  }
}
