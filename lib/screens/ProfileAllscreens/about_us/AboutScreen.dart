import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/Utils/mColor.dart';import 'package:sx_commerece/components/backgroundDesign.dart';
import 'package:sx_commerece/screens/ProfileAllscreens/about_us/AboutProvider.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  AboutProvider aboutProvider;
  double containerWidth;
  final double circleRadius = 120.0;

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
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Stack(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          top: circleRadius / 2.0,
                        ),

                        ///here we create space for the circle avatar to get ut of the box
                        child: Container(
                          height: 300.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8.0,
                                offset: Offset(0.0, 5.0),
                              ),
                            ],
                          ),
                          width: double.infinity,
                          child: Padding(
                              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                              child: Column(
                                children: [
                                  SizedBox(height: size.height * 0.09),
                                  Text("Digitalize Your Business With SoftX",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Text('description_text')
                                      ),
                                    ],
                                  )
                                ],
                              )),
                        ),
                      ),

                      ///Image Avatar
                      Container(
                        width: circleRadius,
                        height: circleRadius,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8.0,
                              offset: Offset(0.0, 5.0),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Center(
                            child: CircleAvatar(
                              backgroundImage: AssetImage('assets/images/logo.jpg'),
                              radius: 55,
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        );
      }),
    );
  }
}
