import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/screens/drawerNavigation/help/HelpProvider.dart';

class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  HelpProvider helpProvider;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HelpProvider>(
      create: (_) => HelpProvider()..setView(context),
      child: Consumer<HelpProvider>(builder: (context, model, child) {
        helpProvider = model;
        return Container();
      }),
    );
  }
}
