import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/components/Animation/FadeAnimation.dart';
import 'package:sx_commerece/components/CustomBackground2.dart';
import 'package:sx_commerece/components/RoundedButton.dart';
import 'package:sx_commerece/main.dart';
import 'package:sx_commerece/screens/onBoard/OnBoardProvider.dart';
import 'package:sx_commerece/Utils/mColor.dart';

class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  OnBoardProvider onBoardProvider;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<OnBoardProvider>(
      create: (_) => OnBoardProvider()..setView(context),
      child: Consumer<OnBoardProvider>(builder: (context, molde, child) {
        onBoardProvider = molde;
        return Scaffold(
          body: CustomBackground2(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.2),
                topImageContainer(size),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(onBoardData.length, (index) => buildDot(index: index)),
                ),
                SizedBox(height: size.height * 0.015),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FadeAnimation(
                      1,
                      Padding(
                          padding: EdgeInsets.only(left: 35, right: 35),
                          child: RoundedButton(
                              text: language.login,
                              press: () {
                                onBoardProvider.gotoLoginPage();
                              })),
                    ),
                    SizedBox(height: size.height * 0.015),
                    FadeAnimation(
                        1.5,
                        Padding(
                            padding: EdgeInsets.only(left: 35, right: 35),
                            child: RoundedButton(
                                text: language.signUp,
                                press: () {
                                  onBoardProvider.goToSignUpPage();
                                }))),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Container topImageContainer(Size size) {
    return Container(
      height: size.height * .5,
      width: size.width,
      child: PageView.builder(
        onPageChanged: (value) {
          setState(() {
            onBoardProvider.currentPage = value;
          });
        },
        itemCount: onBoardData.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(onBoardData[index]['text'],
                  style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 18)),
              Image.asset(onBoardData[index]['image'], height: size.height * .35),
            ],
          );
        },
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 8,
      width: onBoardProvider.currentPage == index ? 20 : 8,
      decoration: BoxDecoration(
        color: onBoardProvider.currentPage == index ? primaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
