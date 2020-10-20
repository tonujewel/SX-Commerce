import 'package:flutter/material.dart';
// ignore: must_be_immutable
class ButtonWithShadow extends StatelessWidget {
  double width;
  Function onPressed;
  String text;
  IconData icon;

  List<BoxShadow> shadow = [BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10))];

  ButtonWithShadow({Key key, @required this.onPressed, @required this.text, this.width, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double containerWidth = size.width * .78;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: size.height * 0.07,
        width: width == null ? containerWidth : width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: shadow,
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Icon(icon == null ? Icons.chevron_right : icon)
            ],
          ),
        ),
      ),
    );
  }
}
