import 'package:flutter/material.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/components/RoundedButton.dart';
import 'package:sx_commerece/screens/login/Login.dart';
import 'file:///D:/SoftX/Flutter%20project/sx_commerece/sx_commerece/lib/main.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Column(
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
                    Spacer(),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(onBoardData.length,
                          (index) => buildDot(index: index)),
                    ),
                    SizedBox(height: 15),
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
