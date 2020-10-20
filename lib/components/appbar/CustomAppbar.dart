import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/CustomIcon/custom_icon_icons.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/components/appbar/AppBarProvider.dart';

// ignore: must_be_immutable
class CustomAppbar extends StatelessWidget {
  AppbarProvider appbarProvider;

  IconData leadIcon;
  String title;
  Function leadingPress;
  int counter = 0;

  CustomAppbar({@required this.leadIcon, this.title, @required this.leadingPress, this.counter});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppbarProvider()..setView(context),
      child: Consumer<AppbarProvider>(
        builder: (context, model, child) {
          appbarProvider = model;
          return AppBar(
            title: Text(
              '$title',
              style: TextStyle(color: textColor),
            ),
            leading: IconButton(
              icon: Icon(
                leadIcon,
                color: textColor,
              ),
              onPressed: leadingPress,
            ),
            backgroundColor: Colors.white,
            actions: <Widget>[
              Badge(
                position: BadgePosition.topEnd(top: 0, end: 3),
                animationDuration: Duration(milliseconds: 300),
                animationType: BadgeAnimationType.slide,
                badgeContent: Text(
                  '$counter',
                  style: TextStyle(color: Colors.white),
                ),
                child: IconButton(
                    icon: Icon(
                      CustomIcon.cart,
                      color: textColor,
                    ),
                    onPressed: () {
                      showToast("clicled");
                    }),
              )
            ],
          );
        },
      ),
    );
  }
}
