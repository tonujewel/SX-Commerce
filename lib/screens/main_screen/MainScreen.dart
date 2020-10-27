import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:sx_commerece/CustomIcon/custom_icon_icons.dart';
import 'package:sx_commerece/main.dart';
import 'package:sx_commerece/screens/bottomNavigation/favorite/FavoriteScreen.dart';
import 'package:sx_commerece/screens/bottomNavigation/home/HomeScreen.dart';
import 'package:sx_commerece/screens/bottomNavigation/profile/ProfileScreen.dart';
import 'package:sx_commerece/screens/cart/CartScreen.dart';
import 'MainPageProvider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  MainPageProvider provider;
  int _currentIndex = 0;
  PageController _pageController;

  List<Widget> tabList = [
    HomeScreen(),
    CartScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: tabList,
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text(language.home),
              icon: Icon(CustomIcon.home)
          ),
          BottomNavyBarItem(
              title: Text(language.cart),
              icon: Icon(CustomIcon.cart)
          ),
          BottomNavyBarItem(
              title: Text(language.favorite),
              icon: Icon(CustomIcon.favorite_border)
          ),
          BottomNavyBarItem(
              title: Text(language.profile),
              icon: Icon(Icons.person_outline)
          ),
        ],
      ),
    );
  }
}