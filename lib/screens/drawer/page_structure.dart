import 'dart:math' show pi;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:sx_commerece/screens/main_screen/MainScreen.dart';


class PageStructure extends StatelessWidget {
  final String title;
  final Widget child;
  final List<Widget> actions;
  final Color backgroundColor;
  final double elevation;

  const PageStructure({
    Key key,
    this.title,
    this.child,
    this.actions,
    this.backgroundColor,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final angle = ZoomDrawer.isRTL() ? 180 * pi / 180 : 0.0;
//    final _currentPage = context.select<MenuProvider, int>((provider) => provider.currentPage);
    final container = Container(
      color: Colors.grey[300],
      child: Center(
      //   child: Text(
      //       "${tr("current")}: ${MainDrawerScreen.mainMenu[_currentPage].title}"),
      // ),
      )
    );
    final color = Theme
        .of(context)
        .accentColor;
    final style = TextStyle(color: color);

    return PlatformScaffold(
      backgroundColor: Colors.transparent,
      appBar: PlatformAppBar(
        automaticallyImplyLeading: false,
        android: (_) => MaterialAppBarData(elevation: elevation),
        // title: PlatformText(
        //   MainDrawerScreen.mainMenu[_currentPage].title,
        // ),
        leading: Transform.rotate(
          angle: angle,
          child: PlatformIconButton(
            icon: Icon(
              Icons.menu,
            ),
            onPressed: () {
              ZoomDrawer.of(context).toggle();
            },
          ),
        ),
        trailingActions: actions,
      ),
      body: MainScreen()
    );
  }
}
