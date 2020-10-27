import 'package:flutter/material.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;

  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = primaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 1,
      height: size.height * .06,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: FlatButton(
          color: color,
          onPressed: press,
          child: Center(
              child: Text(
            text,
            style: TextStyle(color: textColor),
          )),
        ),
      ),
    );
  }
}
