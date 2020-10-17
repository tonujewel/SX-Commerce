import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/components/CustomBackground.dart';
import 'package:sx_commerece/screens/bottomNavigation/profile/ProfileProvider.dart';
import 'package:sx_commerece/CustomIcon/custom_icon_icons.dart' as CustomIcon;

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileProvider profileProvider;
  double paading = 12;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<ProfileProvider>(
      create: (_) => ProfileProvider()..setViwe(context),
      child: Consumer<ProfileProvider>(
        builder: (context, model, child) {
          profileProvider = model;
          return Scaffold(
            body: CustomBackground(
              height: 0.4,
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.08),
                  topTitle(),
                  accountInfo(),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Column(
                        children: [
                          SingleItemButton('Shipping Address',
                              CustomIcon.CustomIcon.map_marker,
                              press: () {}
                              ),
                          SingleItemButton('Payment Method',
                              CustomIcon.CustomIcon.credit_card,
                              press: () {}
                              ),
                          SingleItemButton('Order History',
                              CustomIcon.CustomIcon.history,
                              press: () {}
                              ),
                          SingleItemButton('Delivery Status',
                              CustomIcon.CustomIcon.truck,
                              press: () {}
                              ),
                          SingleItemButton('Language',
                              CustomIcon.CustomIcon.language,
                              press: () {}
                              ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  GestureDetector SingleItemButton(String text, IconData icon,
      {Function press}) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: primaryColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  text,
                  style: TextStyle(fontSize: 15, color: textColor),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, top: 10, right: 20),
              child: Divider(
                thickness: 1,
                color: primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding accountInfo() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/boy.png'),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jewel Rana",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    "tonujewel@gmail.com",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )
                ],
              ),
            ],
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: editButtonBg,
              ),
              child: IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  onPressed: () {}))
        ],
      ),
    );
  }

  Padding topTitle() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Text(
            "Account",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),
          ),
        ],
      ),
    );
  }
}
