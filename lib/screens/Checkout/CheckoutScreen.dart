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
          body: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleText("Shipping Address"),
                  addressContainer(size),
                  titleText("Payment Method"),
                  paymentMethodContainer(size),
                  titleText("Items ( 4 )"),
                  itemsList(size),
                  SizedBox(height: size.height * 0.1,)
                ],
              ),
              Positioned(
                  bottom: 0,
                  child:   Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: bgColor
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Total'),
                              Text(
                                '\$488.00',
                                style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                            ],
                          ),
                          Container(
                            width: size.width * .4,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: FlatButton(
                                color: primaryColor,
                                onPressed: () {
                                  checkoutProvider.goToOrderSuccessScreen();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Center(
                                      child: Text(
                                        "Place Order",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        );
      }),
    );
  }

  Expanded itemsList(Size size) {
    return Expanded(
                  child: ListView.builder(
                      itemCount: cartList.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, indext) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                            top: 15
                          ),
                          child: Container(
                            height: size.height * 0.14,
                            width: size.width,
                            decoration: BoxDecoration(
                                color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: primaryShadow),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFFECEFF1),
                                      borderRadius: new BorderRadius.only(
                                          topLeft: const Radius.circular(10), bottomLeft: const Radius.circular(10))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Image.asset(cartList[indext]['image'],
                                        height: size.height * 0.14, width: size.width * 0.28),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.02,
                                ),
                                Container(
                                  child: Flexible(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              cartList[indext]['name'],
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              softWrap: false,
                                            ),
                                          ),
                                          Text('Medium, light blue'),
                                          SizedBox(
                                            height: size.height * 0.03,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                cartList[indext]['price'],
                                                maxLines: 1,
                                                style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(left: 2, right: 2),
                                                decoration: BoxDecoration(
                                                    color: primaryColor, borderRadius: BorderRadius.circular(2)),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.white,
                                                      size: 14,
                                                    ),
                                                    Text(
                                                      '${cartList[indext]['rating']}',
                                                      maxLines: 1,
                                                      style: TextStyle(color: Colors.white, fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
