import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/provider/MainPageProvider.dart';
import 'package:sx_commerece/screens/home/HomeScreen.dart';
import 'package:sx_commerece/screens/order/OrderScreen.dart';
import 'package:sx_commerece/screens/profile/ProfileScreen.dart';
import 'package:sx_commerece/screens/search/SearchScreen.dart';
import '../main.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  MainPageProvider provider;

  List<Widget> tabList = [
    HomeScreen(),
    SearchScreen(),
    OrderScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainPageProvider>(
      create: (_) => MainPageProvider()..setVIew(context, this),
      child: Consumer<MainPageProvider>(
        builder: (context, model, child) {
          provider = model;
          return Scaffold(
            appBar: AppBar(
              title: Text(provider.tabs[provider.currentIndex].title),
            ),
            body: TabBarView(
              controller: provider.controller,
              children: tabList,
              physics: NeverScrollableScrollPhysics(),
            ),
            bottomNavigationBar: FancyBottomNavigation(
              tabs: provider.tabs
                  .map((e) => TabData(iconData: e.icon, title: e.title))
                  .toList(),
              onTabChangedListener: (position) => provider.changePage(position),
            ),
          );
        },
      ),
    );
  }
}
