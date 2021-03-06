import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/Dimension/Dimension.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/components/appbar/AppBarProvider.dart';
import 'package:sx_commerece/components/appbar/CustomAppbar.dart';
import 'package:sx_commerece/screens/bottomNavigation/home/HomePageProvider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sx_commerece/screens/product_details/ProductDetails.dart';
import 'package:sx_commerece/Utils/mColor.dart';

int _current = 0;
Size size;
int counternew = 0;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomePageProvider homePageProvider;
  Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<HomePageProvider>(
      create: (_) => HomePageProvider()..setView(context),
      child: Consumer<HomePageProvider>(builder: (context, model, child) {
        homePageProvider = model;
        return Scaffold(
          body: Column(
            children: <Widget>[
              CustomAppbar(
                leadingPress: () {
                  homePageProvider.goToSearchScreen();
                },
                leadIcon: Icons.search,
                title: "Home",
                counter: counternew,
              ),
              // carousel
              Expanded(
                child: ListView(
                  children: [
                    carouselColumn(),
                    Padding(
                      padding: EdgeInsets.only(right: 15, left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Categories",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: Dimension.textSizeBig, color: textColor),
                          ),
                          GestureDetector(
                            onTap: (){
                              homePageProvider.callAllCategories();
                            },
                            child: Text(
                              "See all",
                              style: TextStyle(fontSize: Dimension.textSizeBig, color: textColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // category list
                    categoryContainer(),
                    // new title
                    Padding(
                      padding: EdgeInsets.only(right: 15, left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("New Product",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: Dimension.textSizeBig, color: textColor)),
                          Text(
                            "See all",
                            style: TextStyle(fontSize: Dimension.textSizeBig, color: textColor),
                          ),
                        ],
                      ),
                    ),
                    //new items
                    newProductContainer(),
                    Padding(
                      padding: EdgeInsets.only(right: 15, left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Most Favorite",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: Dimension.textSizeBig, color: textColor)),
                          Text(
                            "See all",
                            style: TextStyle(fontSize: Dimension.textSizeBig, color: textColor),
                          ),
                        ],
                      ),
                    ),
                    newProductContainer(),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Column carouselColumn() {
    return Column(
      children: [
        CarouselSlider(
            items: imgList
                .map((item) => Column(
                      children: [
                        Container(
                          child: Container(
                              margin: EdgeInsets.all(5.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                child: Stack(
                                  children: <Widget>[
                                    Image.network(item, fit: BoxFit.cover, width: 1000.0, height: size.height * .25),
                                    Positioned(
                                      bottom: 0.0,
                                      left: 0.0,
                                      right: 0.0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ))
                .toList(),
            options: CarouselOptions(
              height: size.height * .32,
              aspectRatio: 10 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
              scrollDirection: Axis.horizontal,
            )),

        // ............. bottom dot indicator .............
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: imgList.map((url) {
        //     int index = imgList.indexOf(url);
        //     return Container(
        //       width: 8.0,
        //       height: 8.0,
        //       margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        //       decoration: BoxDecoration(
        //         shape: BoxShape.circle,
        //         color: _current == index
        //             ? Color.fromRGBO(0, 0, 0, 0.9)
        //             : Color.fromRGBO(0, 0, 0, 0.4),
        //       ),
        //     );
        //   }).toList(),
        // ),
      ],
    );
  }

  Container categoryContainer() {
    return Container(
      padding: EdgeInsets.only(right: 10, left: 10),
      height: size.height * .19,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: (){
                  homePageProvider.callCategoryWisedProduct(categoryList[index]['name']);
                },
                child: Container(
                  width: size.width * .25,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 5, top: 5, right: 5),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Image.asset(categoryList[index]['image'], height: 50, width: 50, color: primaryColor),
                      SizedBox(height: size.height * marginTop),
                      Text(
                        categoryList[index]['name'],
                        style: TextStyle(color: textColor),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Container newProductContainer() {
    return Container(
      height: size.height * .44,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: newProductList.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails()));
                      },
                      child: Container(
                        width: size.width * .42,
                        decoration: BoxDecoration(
                            color: Colors.white, boxShadow: shadow, borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Image.asset(
                                newProductList[index]["image"],
                                height: size.height * .25,
                                width: size.width,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Row(
                                children: [
                                  Text(
                                    newProductList[index]["price"],
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: textColor, fontSize: Dimension.textSizeBig, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: size.width * .02,
                                  ),
                                  Text(
                                    newProductList[index]["discount"],
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontSize: Dimension.textSizeSmaill,
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                ],
                              ),
                            ),
                            productName(index),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                Provider.of<AppbarProvider>(context, listen: false).incrementCounter();
                              },
                              child: Container(
                                  width: size.width,
                                  height: size.height * .05,
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10.0), bottomLeft: Radius.circular(10.0))),
                                  child: GestureDetector(
                                    onTap: () {
                                      //  homePageProvider.callIncrementMethod();
                                      setState(() {
                                        counternew++;
                                      });
                                    },
                                    child: Center(
                                        child: Text(
                                      'Add to cart',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        right: 0,
                        child: IconButton(
                          onPressed: () {},
                          color: primaryColor,
                          icon: Icon(
                            Icons.favorite_border,
                          ),
                        ))
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Padding productName(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: textColor, fontSize: 16),
                text: newProductList[index]["name"],
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 2, right: 2),
            decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(2)),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 14,
                ),
                Text(
                  "${newProductList[index]["rating"]}",
                  maxLines: 1,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
