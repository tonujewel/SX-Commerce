import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/components/CustomBackground.dart';
import 'package:sx_commerece/screens/OrderSuccess/OrderSuccessProvider.dart';

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
          backgroundColor: Colors.white,
          body: CustomBackground(
              child: Center(
                  child: Image.asset(
            "assets/images/success_order2.gif",


          ))),
        );
      }),
    );
  }
}
