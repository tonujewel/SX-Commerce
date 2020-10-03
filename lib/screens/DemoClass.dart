import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/provider/DemoProvider.dart';

class DemoClass extends StatefulWidget {
  @override
  _DemoClassState createState() => _DemoClassState();
}

class _DemoClassState extends State<DemoClass> {
  DemoProvider demoProvider;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DemoProvider>(
      create: (_)=>DemoProvider()..setView(context),
      child: Consumer<DemoProvider>(
          builder: (context,model,child){
            demoProvider = model;
            return Container(

            );
          }
      ),
    );
  }
}
