import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/components/backgroundDesign.dart';
import 'package:sx_commerece/screens/ProfileAllscreens/help/HelpProvider.dart';
import 'package:sx_commerece/Utils/mColor.dart';

class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  HelpProvider helpProvider;
  double containerWidth;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    containerWidth = size.width * .78;
    return ChangeNotifierProvider<HelpProvider>(
      create: (_) => HelpProvider()..setView(context),
      child: Consumer<HelpProvider>(builder: (context, model, child) {
        helpProvider = model;
        return Scaffold(
          appBar: AppBar(
            title: Text('Help'),
            centerTitle: true,
            backgroundColor: primaryColor,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                helpProvider.backPress();
              },
            ),
          ),
          body: BackgroundDesign(
            child: Column(
              children: [
                SizedBox(height: size.height * .06),
                Container(
                  height: size.height * 0.5,
                  width: containerWidth,
                  margin: EdgeInsets.all(22.0),
                  decoration:
                      BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: shadow),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(22.0),
                        decoration: BoxDecoration(
                          boxShadow: primaryShadow,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('assets/images/boy.png'),
                          backgroundColor: Colors.white,
                        ),
                      ),
                      Text(
                        ' SofX innovatin limited',
                        style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor, fontSize: 22),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
