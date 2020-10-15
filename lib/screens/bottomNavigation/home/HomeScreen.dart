import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:sx_commerece/Dimension/Dimension.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/screens/bottomNavigation/home/HomePageProvider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sx_commerece/screens/product_details/ProductDetailsScreen.dart';

int _current = 0;
Size size;
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
          body: ListView(
            children: <Widget>[
              // search
              Padding(
                padding: EdgeInsets.only(top: 10, right: 15, left: 15),
                child: searchContainer(),
              ),
              SizedBox(height: size.height * marginTop),
              // carousel
              carouselColumn(),
              // category title
              Padding(
                padding: EdgeInsets.only(top: 10, right: 15, left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Dimension.Text_Size_Big,color: textColor),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(fontSize: Dimension.Text_Size_Big,color: textColor),
                    ),
                  ],
                ),
              ),
              // category list
              Padding(
                padding: EdgeInsets.only(top: 10, right: 15, left: 15),
                child: categoryContainer(),
              ),
              SizedBox(height: size.height * marginTop * 2),
              // new title
              Padding(
                padding: EdgeInsets.only(top: 10, right: 15, left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("New Product",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Dimension.Text_Size_Big,color: textColor)),
                    Text(
                      "See all",
                      style: TextStyle(fontSize: Dimension.Text_Size_Big,color: textColor),
                    ),
                  ],
                ),
              ),
              //new items
              newProductContainer(),
              SizedBox(height: size.height * marginTop * 8),
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
                            Image.network(item, fit: BoxFit.cover, width: 1000.0,height: size.height * .25),
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 0.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(200, 0, 0, 0),
                                      Color.fromARGB(0, 0, 0, 0)
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.map((url) {
            int index = imgList.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                    : Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Container categoryContainer() {
    return Container(
      height: size.height * .19,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: shadow,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      categoryList[index]['image'],
                      height: 50,
                      width: 50,
                        color: textColor
                    ),
                  ),
                ),
                SizedBox(height: size.height * marginTop),
                Text(categoryList[index]['name'],style: TextStyle(color: textColor),)
              ],
            ),
          );
        },
      ),
    );
  }

  Container newProductContainer() {
    return Container(
      height: size.height * .6,
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
                        heroTag = "product$index";
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetailsScreen()));
                      },
                      child: Container(
                        width: size.height * .25,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: shadow,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Hero(
                                tag: "product$index",
                                child: Image.asset(
                                  newProductList[index]["image"],
                                  height: 200,
                                  width: 180,
                                ),
                              ),
                              Text(
                                newProductList[index]["name"],
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Dimension.Text_Size_Big,
                                  fontWeight: Dimension.boldText,
                                ),
                              ),
                              Text(
                                newProductList[index]["price"],
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: Dimension.Text_Size_Big),
                              ),
                              RatingBar.readOnly(
                                initialRating: newProductList[index]["rating"],
                                isHalfAllowed: true,
                                halfFilledIcon: Icons.star_half,
                                filledIcon: Icons.star,
                                emptyIcon: Icons.star_border,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                            boxShadow: shadow,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.favorite_border),
                            color: Colors.grey,
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Container(
                          height: size.width * 0.08,
                          width: size.width * 0.15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: primaryColor,
                            boxShadow: shadow,
                          ),
                          child: Center(
                              child: Text(
                            "${newProductList[index]["discount"]}",
                            style: TextStyle(color: Colors.white),
                          ))),
                    )
                  ],
                ),
                SizedBox(height: size.height * marginTop),
              ],
            ),
          );
        },
      ),
    );


  }

  Container searchContainer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: shadow),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.search,color: textColor,),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text("Search", style: TextStyle(fontSize: 20,color: textColor)),
          ),
        ],
      ),
    );
  }

}
