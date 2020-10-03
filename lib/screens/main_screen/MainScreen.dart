import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/provider/MainPageProvider.dart';
import 'package:sx_commerece/screens/drawer_menu/MenuScreen.dart';
import 'package:sx_commerece/screens/home/HomeScreen.dart';
import 'package:sx_commerece/screens/login/Login.dart';
import 'package:sx_commerece/screens/order/OrderScreen.dart';
import 'package:sx_commerece/screens/profile/ProfileScreen.dart';
import 'package:sx_commerece/screens/search/SearchScreen.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';


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
            drawer: ZoomDrawer(
              controller: ZoomDrawerController(

              ),
              menuScreen: MenuScreen(),
              mainScreen: MainScreen(),
              borderRadius: 24.0,
              showShadow: true,
              angle: -12.0,
              backgroundColor: Colors.grey[300],
              slideWidth: MediaQuery.of(context).size.width*.65,
              openCurve: Curves.fastOutSlowIn,
              closeCurve: Curves.bounceIn,
            ),
          );
        },
      ),
    );
  }
}
