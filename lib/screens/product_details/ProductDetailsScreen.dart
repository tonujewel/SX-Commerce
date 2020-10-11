import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:sx_commerece/Dimension/Dimension.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/screens/product_details/ProductDetailsProvider.dart';

class ProductDetailsScreen extends StatefulWidget {
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ProductDetailsProvider productDetailsProvider;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ChangeNotifierProvider<ProductDetailsProvider>(
      create: (_) => ProductDetailsProvider()..setView(context),
      child: Consumer<ProductDetailsProvider>(builder: (context, model, child) {
        productDetailsProvider = model;
        return Scaffold(
          appBar: topAppBar(context),
          body: Stack(
            children: [
              ListView(
                children: [
                  SizedBox(height: size.height * marginTop),
                  topImageStack(size),
                  infoContainer(size),
                  reviewContainer(size)
                ],
              ),
              addCartPositioned()
            ],
          ),
        );
      }),
    );
  }

  Container reviewContainer(Size size) {
    return Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: shadow,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Reviews",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: Dimension.boldText,
                                fontSize: 20),
                          ),
                          Text("See more"),
                        ],
                      ),
                      SizedBox(height: size.height * 0.01),
                      Row(
                        children: [
                          RatingBar.readOnly(
                            initialRating: 5,
                            isHalfAllowed: true,
                            halfFilledIcon: Icons.star_half,
                            filledIcon: Icons.star,
                            emptyIcon: Icons.star_border,
                            size: 20,
                          ),
                          Text(
                            "    4.5 ( 5 Reviews)",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      SizedBox(height: size.height * 0.01),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/boy.png'),
                              radius: 40,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          Column(
                            children: [
                              Text("Jewel Rana", style: TextStyle(color: Colors.black,fontSize: 18)),
                              RatingBar.readOnly(
                                initialRating: 5,
                                isHalfAllowed: true,
                                halfFilledIcon: Icons.star_half,
                                filledIcon: Icons.star,
                                emptyIcon: Icons.star_border,
                                size: 20,
                              ),
                            ],
                          )
                        ],
                      ),
                      Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
                    ],
                  ),
                );
  }
  Container infoContainer(Size size) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: shadow,
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Black T-shirt",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: Dimension.boldText,
                  fontSize: 20),
            ),
            SizedBox(height: size.height * 0.01),
            Row(
              children: [
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
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              "\$500",
              maxLines: 1,
              style: TextStyle(
                  color: Colors.black, fontSize: Dimension.Text_Size_Big),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              "Description",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: Dimension.boldText,
                  fontSize: 20),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,"),
          ],
        ),
      ),
    );
  }
  Stack topImageStack(Size size) {
    return Stack(
      children: [
        Container(
          height: size.height * .32,
          width: size.width,
          margin: EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: shadow,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/images/t_shirt.png",
              height: size.height * .3,
              width: size.width,
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            margin: EdgeInsets.only(right: 10),
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
        Positioned(
          child: Container(
              height: size.width * 0.08,
              width: size.width * 0.15,
              margin: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: primaryColor,
                boxShadow: shadow,
              ),
              child: Center(
                  child: Text(
                "-25%",
                style: TextStyle(color: Colors.white),
              ))),
        )
      ],
    );
  }
  AppBar topAppBar(BuildContext context) {
    return AppBar(
      title: Text("Product details"),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {
            showToast('more button clicked');
          },
        )
      ],
    );
  }
  Positioned addCartPositioned() {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: 50,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: primaryColor),
          child: Center(
            child: Text("Add to cart",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
