import 'package:flutter/material.dart';
import 'package:sx_commerece/screens/ProfileAllscreens/UpdateProfile/UpdateProfile.dart';

class ProfileProvider with ChangeNotifier {
  BuildContext context;

  ProfileProvider();

  void setView(BuildContext context) => this.context = context;

  void updateProfile(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateProfile()));
  }
}
