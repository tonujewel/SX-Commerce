import 'package:flutter/material.dart';
import 'package:sx_commerece/CustomIcon/custom_icon_icons.dart' as CustomIcon;
import 'package:sx_commerece/main.dart';

class MainPageProvider with ChangeNotifier{
  BuildContext context;
  TabController controller;
  int currentIndex = 0;
  List<BottomTab> tabs=[
    BottomTab(
        icon: CustomIcon.CustomIcon.home,
        title: language.home
    ),
    BottomTab(
        icon: Icons.shopping_basket,
        title: language.order
    ),
    BottomTab(
        icon: Icons.favorite,
        title: language.favorite
    ),

    BottomTab(
        icon: Icons.person,
        title: language.profile
    ),
  ];

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }


  void setVIew(BuildContext context,mainpage){
    this.context=context;
    controller = TabController(vsync: mainpage, length: tabs.length);
  }

  changePage(int position) {
    currentIndex = position;
    controller.animateTo(position);
    notifyListeners();
  }
}

class BottomTab{
  IconData icon;
  String title;

  BottomTab({this.icon, this.title});
}