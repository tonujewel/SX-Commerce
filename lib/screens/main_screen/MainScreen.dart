import 'dart:math';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/components/ShoppingCartBadge.dart';
import 'package:sx_commerece/screens/bottomNavigation/favorite/FavoriteScreen.dart';
import 'package:sx_commerece/screens/bottomNavigation/home/HomeScreen.dart';
import 'package:sx_commerece/screens/bottomNavigation/order/OrderScreen.dart';
import 'package:sx_commerece/screens/bottomNavigation/profile/ProfileScreen.dart';
import 'MainPageProvider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  MainPageProvider provider;
  bool isOpen = false;

  List<Widget> tabList = [
    HomeScreen(),
    OrderScreen(),
    FavoriteScreen(),
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
          return ValueListenableBuilder<DrawerState>(
            valueListenable: ZoomDrawer.of(context).stateNotifier,
            builder: (context, state, child) {
              return AbsorbPointer(
                absorbing: state != DrawerState.closed,
                child: child,
              );
            },
            child: GestureDetector(
                child: Scaffold(
                  appBar: AppBar(
                    leading: IconButton(
                      icon: Icon(Icons.search, color: textColor,),
                      onPressed: () {},
                    ),
                    backgroundColor: Colors.white,
                    actions: <Widget>[
                      ShoppingCartBadge(
                        counter: provider.counter,
                        onPress: (){
                          showToast("This is a msg");
                        }
                      ),
                    ],
                  ),
                 bottomNavigationBar: FancyBottomNavigation(
                 tabs: provider.tabs
                    .map((e) => TabData(iconData: e.icon, title: e.title))
                    .toList(),
                     onTabChangedListener: (position) =>
                    provider.changePage(position),
                  ),
                 body: TabBarView(
                    controller: provider.controller,
                    children: tabList,
                    physics: NeverScrollableScrollPhysics(),
                   ),
               )
            ),
          );
        },
      ),
    );
  }

}



