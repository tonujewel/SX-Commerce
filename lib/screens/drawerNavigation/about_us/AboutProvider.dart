import 'package:flutter/material.dart';

class AboutProvider with ChangeNotifier {
  BuildContext context;

  AboutProvider();

  void setView(BuildContext context) => this.context = context;

  void backPress() {
    Navigator.pop(context);
  }
}
