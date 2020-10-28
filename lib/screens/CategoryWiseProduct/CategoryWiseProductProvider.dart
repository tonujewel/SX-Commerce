import 'package:flutter/material.dart';

class CategoryWiseProductProvider with ChangeNotifier{

  BuildContext context;
  CategoryWiseProductProvider();

  void setView(BuildContext context)=>this.context=context;

  backPress(){
    Navigator.pop(context);
  }
}