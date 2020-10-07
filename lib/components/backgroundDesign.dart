import 'package:flutter/material.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';

class BackgroundDesign extends StatelessWidget {
  final Widget child;

  const BackgroundDesign({Key key, this.child})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
              top: 0,
              child: Container(
                width: size.width,
                height: size.height * 0.2,
                color: primaryColor,
              )),
          Positioned.fill(child: child)
        ],
      ),
    );
  }
}
