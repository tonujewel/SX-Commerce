import 'package:flutter/material.dart';
import 'package:sx_commerece/components/CarouselSlider.dart';
import 'file:///D:/SoftX/Flutter%20project/sx_commerece/sx_commerece/lib/screens/main.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
       children:<Widget> [
         CarouselSlider(),

       ],
      ),

    );
  }
}
