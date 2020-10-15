import 'package:flutter/material.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';

class CustomBackground extends StatelessWidget {
  final Widget child;

  const CustomBackground({Key key, this.child})
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
                height: size.height * 0.5,
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
