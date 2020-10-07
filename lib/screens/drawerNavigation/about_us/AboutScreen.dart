import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/components/backgroundDesign.dart';
import 'package:sx_commerece/screens/drawerNavigation/about_us/AboutProvider.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  AboutProvider aboutProvider;
  double containerWidth;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    containerWidth = size.width * .78;

    return ChangeNotifierProvider<AboutProvider>(
      create: (_) => AboutProvider()..setView(context),
      child: Consumer<AboutProvider>(builder: (context, model, child) {
        aboutProvider = model;
        return Scaffold(
          appBar: AppBar(
            title: Text('About Us'),
            centerTitle: true,
            backgroundColor: primaryColor,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                aboutProvider.backPress();
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
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: shadow),
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
                      Text(' SofX innovatin limited', style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor,fontSize: 22),),
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
