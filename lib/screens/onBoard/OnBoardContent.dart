import 'package:flutter/material.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';

class OnBoardContent extends StatelessWidget {
  final String image, text;
  const OnBoardContent({
    Key key,
    this.image,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget> [
        Spacer(),
        Text("$text",style: TextStyle(color: textColor, fontWeight: FontWeight.bold,fontSize: 22),),
        Spacer(),
        Image.asset('$image',)
      ],
    );
  }
}
