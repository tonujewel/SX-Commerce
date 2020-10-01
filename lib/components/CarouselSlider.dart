import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class CarouselSlider extends StatefulWidget {
  @override
  _CarouselSliderState createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
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
      ),
    );
  }
}
