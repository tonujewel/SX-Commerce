import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/screens/drawerNavigation/Settings/SettingsProvider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  SettingsProvider settingsProvider;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SettingsProvider>(
      create: (_) => SettingsProvider()..setView(context),
      child: Consumer<SettingsProvider>(builder: (context, model, child) {
        settingsProvider = model;
        return Container();
      }),
    );
  }
}
