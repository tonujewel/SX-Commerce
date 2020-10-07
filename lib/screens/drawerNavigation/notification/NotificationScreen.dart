import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/screens/drawerNavigation/notification/NotificationProvider.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationProvider notificationProvider;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NotificationProvider>(
      create: (_) => NotificationProvider()..setView(context),
      child: Consumer<NotificationProvider>(builder: (context, model, child) {
        notificationProvider = model;
        return Scaffold(
          appBar: AppBar(
            title: Text('Help'),
            centerTitle: true,
            backgroundColor: primaryColor,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                notificationProvider.backPress();
              },
            ),
          ),
          body: Center(
            child: Text('Notifications'),
          ),
        );
      }),
    );
  }
}
