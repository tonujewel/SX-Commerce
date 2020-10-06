import 'dart:math';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import 'file:///D:/SoftX/Flutter%20project/sx_commerece/sx_commerece/lib/screens/main_screen/MainPageProvider.dart';
import 'package:sx_commerece/screens/bottomNavigation/favorite/FavoriteScreen.dart';
import 'package:sx_commerece/screens/bottomNavigation/home/HomeScreen.dart';
import 'package:sx_commerece/screens/bottomNavigation/order/OrderScreen.dart';
import 'package:sx_commerece/screens/bottomNavigation/profile/ProfileScreen.dart';


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
    final rtl = ZoomDrawer.isRTL();
    final angle = ZoomDrawer.isRTL() ? 180 * pi / 180 : 0.0;
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
              backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    title: Text(provider.tabs[provider.currentIndex].title),
                    leading: Transform.rotate(
                      angle: angle,
                        child: PlatformIconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                         ZoomDrawer.of(context).toggle();
                      },
                  ),
                ),
                // trailingActions: actions,
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
            )),
          );
        },
      ),
    );
  }
}
