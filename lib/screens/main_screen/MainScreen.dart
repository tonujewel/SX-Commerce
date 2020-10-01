import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:sx_commerece/screens/home/home_screen.dart';
import 'package:sx_commerece/screens/order/oderScreen.dart';
import 'package:sx_commerece/screens/profile/profileScreen.dart';
import 'package:sx_commerece/screens/search/SearchScreen.dart';
import '../main.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  int _currentIndex = 0;

  List<Widget> tabList = [
    HomeScreen(),
    SearchScreen(),
    OrderScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: tabList.length);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(language.appBarTitle),
      ),
      body: TabBarView(
        controller: _controller,
        children: tabList,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(iconData: Icons.home, title: language.home),
          TabData(iconData: Icons.search, title: language.search),
          TabData(iconData: Icons.shopping_basket, title: language.order),
          TabData(iconData: Icons.person, title: language.profile)
        ],
        onTabChangedListener: (position) {
          setState(() {
            _currentIndex = position;
            _controller.animateTo(position);
            debugPrint("onTabChangedListener'$position");
          });
        },
      ),
    );
  }
}
