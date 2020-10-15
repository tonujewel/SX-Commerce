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
    Size size = MediaQuery.of(context).size;
    return Column(
      children:<Widget> [
        Text("$text",style: TextStyle(color: boardTextColor, fontWeight: FontWeight.bold,fontSize: 22),),
        Image.asset('$image',height: size.height*.44,)
      ],
    );
  }
}
