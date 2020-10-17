import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier{
  BuildContext context;

  ProfileProvider();
  void setViwe(BuildContext context) => this.context = context;
}