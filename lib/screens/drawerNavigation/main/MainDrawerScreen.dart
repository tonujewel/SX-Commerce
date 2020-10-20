import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/screens/drawerNavigation/main/menu_page.dart';
import 'package:sx_commerece/screens/main_screen/MainScreen.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';

import 'MainDrawerProvider.dart';

class MainDrawerScreen extends StatefulWidget {
  @override
  _MainDrawerScreenState createState() => _MainDrawerScreenState();
}

class _MainDrawerScreenState extends State<MainDrawerScreen> {
  MainDrawerProvider mainDrawerProvider;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainDrawerProvider>(
      create: (_) => MainDrawerProvider()..setView(context),
      child: Consumer<MainDrawerProvider>(builder: (context, model, child) {
        mainDrawerProvider = model;
        return ZoomDrawer(
          controller: mainDrawerProvider.drawerController,
          menuScreen: MenuScreen(
            mainMenu,
            callback: mainDrawerProvider.updatePage,
            current: mainDrawerProvider.currentPage,
          ),
          mainScreen: MainScreen(),
          borderRadius: 24.0,
          backgroundColor: Colors.grey[300],
          showShadow: true,
          angle: 0.0,
          slideWidth: MediaQuery.of(context).size.width * (ZoomDrawer.isRTL() ? .30 : 0.70),
        );
      }),
    );
  }
}
