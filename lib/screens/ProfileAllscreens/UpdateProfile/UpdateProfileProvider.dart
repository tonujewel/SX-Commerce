import 'package:flutter/material.dart';

class UpdateProfileProvider with ChangeNotifier {
  BuildContext context;

  UpdateProfileProvider();

  void setView(BuildContext context) => this.context = context;

  void backPress() {
    Navigator.pop(context);
  }
}
