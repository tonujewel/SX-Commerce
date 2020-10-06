import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'file:///D:/SoftX/Flutter%20project/sx_commerece/sx_commerece/lib/screens/drawerNavigation/main/MainDrawerProvider.dart';
import 'package:sx_commerece/screens/drawerNavigation/main/MenuProvider.dart';

class MenuScreen extends StatefulWidget {
  final List<MenuItem> mainMenu;
  final Function(int) callback;
  final int current;

  MenuScreen(
    this.mainMenu, {
    Key key,
    this.callback,
    this.current,
  });

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  MainDrawerProvider mainDrawerProvider;
  final widthBox = SizedBox(
    width: 16.0,
  );
  MenuProvider menuProvider;

  @override
  Widget build(BuildContext context) {
    mainDrawerProvider = Provider.of<MainDrawerProvider>(context);
    return ChangeNotifierProvider<MenuProvider>(
      create: (_) => MenuProvider()..setView(context),
      child: Consumer<MenuProvider>(builder: (context, model, child) {
        menuProvider = model;
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Colors.red,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 24.0, left: 24.0, right: 24.0),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 36.0, left: 24.0, right: 24.0),
                    child: Text(
                      tr("name"),
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Selector<MenuProvider, int>(
                    selector: (_, provider) => provider.currentPage,
                    builder: (_, index, __) => Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ...widget.mainMenu
                            .map((item) => MenuItemWidget(
                                  key: Key(item.index.toString()),
                                  item: item,
                                  selectedIndex: menuProvider.currentPage,
                                  callback: widget.callback,
                                  widthBox: widthBox,
                                  style: TextStyle(color: Colors.white),
                                  selected: index == item.index,
                                  onPress: () {
                                    menuProvider.newCurrentPage = item.index;
                                    menuProvider.drawerNavigation();
                                  },
                                ))
                            .toList()
                      ],
                    ),
                  ),
                  Spacer(),
                  logOut(),
                  Spacer(),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Padding logOut() {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
      child: OutlineButton(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            tr("logout"),
            style: TextStyle(fontSize: 18),
          ),
        ),
        borderSide: BorderSide(color: Colors.white, width: 2.0),
        onPressed: () => print("Pressed !"),
        textColor: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      ),
    );
  }
}

class MenuItemWidget extends StatelessWidget {
  final MenuItem item;
  final Widget widthBox;
  final TextStyle style;
  final Function callback;
  final bool selected;
  int selectedIndex;
  Function onPress;

  final white = Colors.white;

  MenuItemWidget(
      {Key key,
      this.item,
      this.widthBox,
      this.style,
      this.callback,
      this.selected,
      this.selectedIndex,
      this.onPress
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(12),
      onPressed: onPress,

      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(item.icon, color: white, size: 24),
          widthBox,
          Expanded(child: Text(item.title, style: style))
        ],
      ),
    );
  }
}
