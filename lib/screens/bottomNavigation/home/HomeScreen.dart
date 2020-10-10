import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:sx_commerece/Dimension/Dimension.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/components/CarouselSlider.dart';
import 'package:sx_commerece/Dimension/Dimension.dart';
import 'package:sx_commerece/screens/bottomNavigation/home/HomePageProvider.dart';

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
              Padding(
                padding: EdgeInsets.only(top: 10, right: 15, left: 15),
                child: CarouselSlider(),
              ),
              SizedBox(height: size.height * marginTop * 2),
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
                          fontSize: Dimension.Text_Size_Big),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(fontSize: Dimension.Text_Size_Big),
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
                    Text(
                      "New",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Dimension.Text_Size_Big),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(fontSize: Dimension.Text_Size_Big),
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

  Container categoryContainer() {
    return Container(
      height: size.height * .17,
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
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                SizedBox(height: size.height * marginTop),
                Text(categoryList[index]['name'])
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
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: size.height * .38,
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
                            Image.asset('assets/images/t_shirt.png',
                              height: 200,
                              width: 180,
                            ),
                            Text(
                              "Black T-shirt ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Dimension.Text_Size_Big, fontWeight: Dimension.boldText),
                            ),
                            Text(
                              "\$500 ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Dimension.Text_Size_Big),
                            ),
                            RatingBar.readOnly(
                              initialRating: 5,
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
                            onPressed: () {},
                          ),

                          // child: Image.asset('assets/images/favorite_no.png',
                          // color: Colors.red,
                          // height: 30,
                          // width: 30,),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Container(
                          height: size.width*0.08,
                          width: size.width*0.15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: primaryColor,
                            boxShadow: shadow,
                          ),
                          child: Center(child: Text("-50%",style: TextStyle(color: Colors.white),))

                        // child: Image.asset('assets/images/favorite_no.png',
                        // color: Colors.red,
                        // height: 30,
                        // width: 30,),
                      ),
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
      //margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: shadow),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.search),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text("Search", style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
