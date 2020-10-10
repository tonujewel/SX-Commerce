import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';

class CarouselSlider extends StatefulWidget {
  @override
  _CarouselSliderState createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: new BorderRadius.all(Radius.circular(5)),
        boxShadow: shadow
      ),
      height: 200,
      child: Carousel(
        boxFit: BoxFit.fill,
        images: [
          AssetImage('assets/images/one.png'),
          AssetImage('assets/images/two.png'),
          AssetImage('assets/images/three.png')
        ],
        autoplay: true,
        indicatorBgPadding: 9.0,
        borderRadius: true,
      ),
    );
  }
}
