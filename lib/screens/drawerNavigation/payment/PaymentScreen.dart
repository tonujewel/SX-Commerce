import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/screens/drawerNavigation/payment/PaymentProvider.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  PaymentProvider paymentProvider;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PaymentProvider>(
      create: (_) => PaymentProvider()..setView(context),
      child: Consumer<PaymentProvider>(builder: (context, model, child) {
        paymentProvider = model;
        return Container();
      }),
    );
  }
}
