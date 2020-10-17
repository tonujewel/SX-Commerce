import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/components/ShoppingCartBadge.dart';
import 'package:sx_commerece/components/appbar/AppBarProvider.dart';

class CustomAppbar extends StatelessWidget {

  AppbarProvider appbarProvider;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_)=> AppbarProvider()..setView(context),
      child: Consumer<AppbarProvider>(builder: (context, model, child){
        appbarProvider = model;
        return AppBar(
          leading: IconButton(
            icon: Icon(Icons.search, color: textColor,),
            onPressed: () {},
          ),
          backgroundColor: Colors.white,
          actions: <Widget>[
            ShoppingCartBadge(
                counter: appbarProvider.counter,
                onPress: (){
                  appbarProvider.goToCartPage();
                }
            ),
          ],
        );
      },),
    );
  }
}
