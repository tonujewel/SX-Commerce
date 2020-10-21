import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/components/appbar/CustomAppbar.dart';
import 'package:sx_commerece/screens/bottomNavigation/favorite/FavoriteProvider.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  FavoriteProvider favoriteProvider;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<FavoriteProvider>(
      create: (_) => FavoriteProvider()..setView(context),
      child: Consumer<FavoriteProvider>(builder: (context, model, child) {
        favoriteProvider = model;
        return Scaffold(
          body: Column(
            children: <Widget>[
              CustomAppbar(
                leadingPress: () {},
                leadIcon: Icons.search,
                title: 'Favorite',
                counter: 1,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: cartList.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, indext) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                          bottom: 20,
                        ),
                        child: Container(
                          height: size.height * 0.14,
                          width: size.width,
                          decoration: BoxDecoration(
                              color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: primaryShadow),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFFECEFF1),
                                    borderRadius: new BorderRadius.only(
                                        topLeft: const Radius.circular(10), bottomLeft: const Radius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Image.asset(cartList[indext]['image'],
                                      height: size.height * 0.14, width: size.width * 0.28),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              Container(
                                child: Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            cartList[indext]['name'],
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            softWrap: false,
                                          ),
                                        ),
                                        Text('Medium, light blue'),
                                        SizedBox(
                                          height: size.height * 0.03,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              cartList[indext]['price'],
                                              maxLines: 1,
                                              style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(left: 2, right: 2),
                                              decoration: BoxDecoration(
                                                  color: primaryColor, borderRadius: BorderRadius.circular(2)),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.white,
                                                    size: 14,
                                                  ),
                                                  Text(
                                                    '${cartList[indext]['rating']}',
                                                    maxLines: 1,
                                                    style: TextStyle(color: Colors.white, fontSize: 14),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        );
      }),
    );
  }
}
