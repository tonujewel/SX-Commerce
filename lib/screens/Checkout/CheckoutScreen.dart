import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/screens/Checkout/CheckoutProvider.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  CheckoutProvider checkoutProvider;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<CheckoutProvider>(
      create: (_) => CheckoutProvider()..setView(context),
      child: Consumer<CheckoutProvider>(builder: (context, model, child) {
        checkoutProvider = model;
        return Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            title: Text(
              'Checkout',
              style: TextStyle(color: textColor),
            ),
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: textColor),
                onPressed: () {
                  checkoutProvider.backPress();
                }),
            backgroundColor: Colors.white,
          ),
          body: ListView(
            children: [
              titleText("Shipping Address"),
              addressContainer(size),
              titleText("Payment Method"),
              paymentMethodContainer(size),
              titleText("Items ( 4 )"),
            ],
          ),
        );
      }),
    );
  }

  Container paymentMethodContainer(Size size) {
    return Container(
              width: size.width,
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(left: 15,right: 15,top: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white, boxShadow: primaryShadow),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Icon(
                      Icons.credit_card_outlined,
                      color: primaryColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Cash On Delivery",
                      style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
                    ),
                  ]),
                  Container(
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xFFD9DCDF)),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),
                      )),
                ],
              ),
            );
  }

  Container addressContainer(Size size) {
    return Container(
              width: size.width,
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(left: 15,right: 15,top: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white, boxShadow: primaryShadow),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mirpur DOHS', style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
                      Text('House no: 2, Avenue: 1'),
                      Text('Dhaka, Bangladesh'),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xFFD9DCDF)),
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  )
                ],
              ),
            );
  }

  Padding titleText(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Text('$text', style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 18)),
    );
  }
}
