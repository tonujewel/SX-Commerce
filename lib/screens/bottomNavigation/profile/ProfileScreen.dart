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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.08),
                    topTitle(),
                    accountInfo(),
                    firstContainer(),
                    secondContainer()
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Padding secondContainer() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white, boxShadow: primaryShadow),
        child: Column(
          children: [
            SingleItemButton('Favorite', CustomIcon.CustomIcon.favorite_border, press: () {}),
            SingleItemButton('Privacy Policy', CustomIcon.CustomIcon.lock, press: () {}),
            SingleItemButton('Frequently Asked Questions', CustomIcon.CustomIcon.question_circle_o, press: () {}),
            SingleItemButton('Legal Information', CustomIcon.CustomIcon.info_outline, press: () {}),
            SingleItemButton('Rate Our App', CustomIcon.CustomIcon.star_border, press: () {}),
          ],
        ),
      ),
    );
  }

  Padding firstContainer() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white, boxShadow: primaryShadow),
        child: Column(
          children: [
            SingleItemButton('Shipping Address', CustomIcon.CustomIcon.map_marker, press: () {}),
            SingleItemButton('Payment Method', CustomIcon.CustomIcon.credit_card, press: () {}),
            SingleItemButton('Order History', CustomIcon.CustomIcon.history, press: () {}),
            SingleItemButton('Delivery Status', CustomIcon.CustomIcon.truck, press: () {}),
            SingleItemButton('Language', CustomIcon.CustomIcon.language, press: () {}),
          ],
        ),
      ),
    );
  }

  GestureDetector SingleItemButton(String text, IconData icon, {Function press}) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.all(5),
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
                  style: TextStyle(color: textColor),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, top: 5, right: 20),
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
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
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
                borderRadius: BorderRadius.circular(40),
                color: editButtonBg,
              ),
              child: IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    showToast('edit icon clicked');
                  }))
        ],
      ),
    );
  }

  Padding topTitle() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Account",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),
          ),
          IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () {
                showToast('Logout clicked');
              })
        ],
      ),
    );
  }
}
