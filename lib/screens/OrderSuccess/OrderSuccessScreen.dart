import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/Utils/mColor.dart';import 'package:sx_commerece/screens/OrderSuccess/OrderSuccessProvider.dart';

class OrderSuccessScreen extends StatefulWidget {
  @override
  _OrderSuccessScreenState createState() => _OrderSuccessScreenState();
}

class _OrderSuccessScreenState extends State<OrderSuccessScreen> {
  OrderSuccessProvider orderSuccessProvider;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<OrderSuccessProvider>(
      create: (_) => OrderSuccessProvider()..setView(context),
      child: Consumer<OrderSuccessProvider>(builder: (context, model, child) {
        orderSuccessProvider = model;
        return Scaffold(
          backgroundColor: Colors.blue,
          body: Container(
            height: size.height,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: size.height * .07,
                  backgroundImage: AssetImage('assets/images/success_order.gif'),
                ),
                SizedBox(height: size.height * .03),
                Text('Order Placed!', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                SizedBox(height: size.height * .03),
                text('Your order places successfully!'),
                text('For more details, check Delivery status'),
                text('under profile tab'),
                SizedBox(height: size.height * .03),
                Container(
                  width: size.width * .6,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FlatButton(
                      color: Colors.white,
                      onPressed: () {
                      orderSuccessProvider.goToOrderStatusScreen();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Center(
                            child: Text(
                              "Delivery Status",
                              style: TextStyle(color: primaryColor),
                            )),
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

  Text text(String text) => Text("$text",style: TextStyle(color: Colors.white, ), );
}
