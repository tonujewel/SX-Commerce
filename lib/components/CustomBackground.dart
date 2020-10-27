import 'package:flutter/material.dart';
import 'package:sx_commerece/Utils/mColor.dart';
// ignore: must_be_immutable
class CustomBackground extends StatelessWidget {
  Widget child;
  double height;

  CustomBackground({Key key, this.child, this.height})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: bgColor,
      child: Stack(
        children: [
          Positioned(
              top: 0,
              child: Container(
                width: size.width,
                height: height == null ? size.height * 0.5 : size.height * height,
                decoration: BoxDecoration(
                  color: primaryColor,
                ),
              )),
          Positioned.fill(child: child)
        ],
      ),
    );
  }
}
