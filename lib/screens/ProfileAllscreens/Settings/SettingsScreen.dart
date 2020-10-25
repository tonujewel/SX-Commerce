import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/components/backgroundDesign.dart';
import 'package:sx_commerece/components/buttonWithShadow.dart';
import 'package:sx_commerece/screens/ProfileAllscreens/Settings/SettingsProvider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  SettingsProvider settingsProvider;
  double containerWidth;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    containerWidth = size.width * .78;
    return ChangeNotifierProvider<SettingsProvider>(
      create: (_) => SettingsProvider()..setView(context),
      child: Consumer<SettingsProvider>(builder: (context, model, child) {
        settingsProvider = model;
        return Scaffold(
          appBar: AppBar(
            title: Text('Settings'),
            centerTitle: true,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                settingsProvider.backPress();
              },
            ),
          ),
          body: BackgroundDesign(
            child: Column(
              children: [
                SizedBox(height: size.height * .05),
                topContainer(size),
                ButtonWithShadow(
                  text: "Language",
                  onPressed: () {},
                ),
                SizedBox(height: size.height * .02),
                ButtonWithShadow(
                  onPressed: () {},
                  text: "Notification",
                ),
                SizedBox(height: size.height * .02),
                ButtonWithShadow(
                  onPressed: () {},
                  text: "Account Settings",
                ),
                SizedBox(height: size.height * .02),
                ButtonWithShadow(
                  onPressed: () {},
                  text: "Dark Mode",
                ),
                SizedBox(height: size.height * .02),
                ButtonWithShadow(
                  onPressed: () {},
                  text: "Profile",
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  Container topContainer(Size size) {
    return Container(
      height: size.height * 0.27,
      width: containerWidth,
      margin: EdgeInsets.all(22.0),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: shadow),
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, top: 15),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(boxShadow: primaryShadow, borderRadius: BorderRadius.circular(30)),
                  child: CircleAvatar(
                    foregroundColor: Colors.red,
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/boy.png'),
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(height: size.height * .02),
                Text('Jewel Rana', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black)),
                Text('tonujewel@gmail.com', style: TextStyle(color: Colors.grey)),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  showToast('clicked');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
