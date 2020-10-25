import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/components/backgroundDesign.dart';
import 'package:sx_commerece/screens/ProfileAllscreens/notification/NotificationProvider.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationProvider notificationProvider;
  double containerWidth, containerHeight;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    containerWidth = size.width * .9;
    containerHeight = size.height * 0.1;
    return ChangeNotifierProvider<NotificationProvider>(
      create: (_) => NotificationProvider()..setView(context),
      child: Consumer<NotificationProvider>(builder: (context, model, child) {
        notificationProvider = model;
        return Scaffold(
          appBar: AppBar(
            title: Text('Notifications'),
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
          body: BackgroundDesign(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    notificationProvider.currentIndex = index;
                    notificationProvider.listOnClick();
                  },
                  child: Container(
                      margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                      height: containerHeight,
                      width: containerWidth,
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: shadow),
                      child: ListTile(
                        leading: imageContainer(index),
                        title: Text(notificationLIst[index]['title']),
                        subtitle: Text(notificationLIst[index]['description']),
                      )),
                );
              },
              itemCount: notificationLIst.length,
            ),
          ),
        );
      }),
    );
  }

  Container imageContainer(int index) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: shadow,
      ),
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: Center(
          child: CircleAvatar(
            backgroundImage: AssetImage(notificationLIst[index]['image']),
            radius: 55,
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
