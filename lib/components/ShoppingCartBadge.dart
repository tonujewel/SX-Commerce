import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';

class ShoppingCartBadge extends StatelessWidget {

  int counter = 0;
  Function onPress ;


  ShoppingCartBadge({this.counter, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Badge(
      position: BadgePosition.topEnd(top: 0, end: 3),
      animationDuration: Duration(milliseconds: 300),
      animationType: BadgeAnimationType.slide,
      badgeContent: Text(
        counter.toString(),
        style: TextStyle(color: Colors.white),
      ),
      child: IconButton(icon: Icon(Icons.notifications,color: textColor,),
          onPressed: onPress),
    );
  }
}
