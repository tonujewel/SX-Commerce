import 'package:flutter/material.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/components/RoundedButton.dart';
import 'package:sx_commerece/main.dart';
import 'package:sx_commerece/screens/bottomNavigation/home/HomeScreen.dart';
import 'package:sx_commerece/screens/login/Login.dart';
import 'package:sx_commerece/screens/onBoard/OnBoardContent.dart';
import 'package:sx_commerece/screens/signUp/SignUp.dart';

class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Expanded(
              flex: 5,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: onBoardData.length,
                itemBuilder: (context, index) => OnBoardContent(
                  text: onBoardData[index]['text'],
                  image: onBoardData[index]['image'],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(onBoardData.length,
                          (index) => buildDot(index: index)),
                    ),
                    SizedBox(height:size.height * 0.1),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 35,right: 35),
                            child: RoundedButton(
                              text: language.login,
                              press: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                              }
                            )
                        ),
                        SizedBox(height:size.height * 0.03),
                        Padding(
                            padding: EdgeInsets.only(left: 35,right: 35),
                            child: RoundedButton(
                                text: language.signUp,
                                press: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));}
                            )
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 8,
      width: currentPage == index ? 20 : 8,
      decoration: BoxDecoration(
        color: currentPage == index ? primaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
