import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/screens/drawerNavigation/about_us/AboutProvider.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  AboutProvider aboutProvider;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AboutProvider>(
      create: (_) => AboutProvider()..setView(context),
      child: Consumer<AboutProvider>(builder: (context, model, child) {
        aboutProvider = model;
        return Container();
      }),
    );
  }
}
