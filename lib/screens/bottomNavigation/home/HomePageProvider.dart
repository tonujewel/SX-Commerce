import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/components/appbar/AppBarProvider.dart';
import 'package:sx_commerece/screens/AllCategories/AllCategories.dart';
import 'package:sx_commerece/screens/SearchScreen/search_screen.dart';

class HomePageProvider with ChangeNotifier {
  BuildContext context;

  HomePageProvider();
  AppbarProvider appbarProvider;

  void setView(BuildContext context){
    this.context = context;
     appbarProvider = Provider.of<AppbarProvider>(context);
  }

  void goToSearchScreen(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
  }

  void callIncrementMethod(){
    Provider.of<AppbarProvider>(context, listen: false).incrementCounter();
    notifyListeners();
  }

  void callAllCategories(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>AllCategories()));
  }
}
