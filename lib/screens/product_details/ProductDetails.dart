import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/components/ShoppingCartBadge.dart';
import 'package:sx_commerece/screens/onBoard/OnBoardContent.dart';
import 'package:sx_commerece/screens/product_details/ProductDetailsProvider.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int currentPage = 0;
  ProductDetailsProvider productDetailsProvider;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<ProductDetailsProvider>(
      create: (_) => ProductDetailsProvider()..setView(context),
      child: Consumer<ProductDetailsProvider>(builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: Column(
            children: [
              topImageSlider(size),
              price_rating(),
              name(),
              divider(),

              TabBar(
                tabs: [
                  new Tab(icon: new Icon(Icons.directions_car)),
                  new Tab(icon: new Icon(Icons.directions_transit)),
                  new Tab(icon: new Icon(Icons.directions_bike)),
                ],
              ),



              




            ],
          ),
        );
      }),
    );
  }

  Padding divider() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Divider(
        thickness: 1,
        color: Colors.blue[100],
      ),
    );
  }

  Padding name() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Black T-shirt ",
            style: TextStyle(
                fontSize: 16, color: textColor, fontWeight: FontWeight.bold),
          ),
          Text(
            "In Stock",
            style: TextStyle(color: primaryColor),
          ),
        ],
      ),
    );
  }

  Padding price_rating() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "\$199.99",
            style: TextStyle(
                fontSize: 16, color: primaryColor, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              RatingBar.readOnly(
                initialRating: 4.5,
                isHalfAllowed: true,
                halfFilledIcon: Icons.star_half,
                filledIcon: Icons.star,
                emptyIcon: Icons.star_border,
                size: 18,
              ),
              SizedBox(
                width: 10,
              ),
              Text("4.5"),
            ],
          )
        ],
      ),
    );
  }

  Padding topImageSlider(Size size) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: size.height * .35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: imageBg),
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: onBoardData.length,
              itemBuilder: (context, index) => Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      '${productDetails[index]['image']}',
                      height: size.height * .3,
                      width: size.width,
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    productDetails.length, (index) => buildDot(index: index)),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Row(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      color: primaryColor,
                    ),
                    onPressed: () {
                      showToast("favorite clicked");
                    }),
                IconButton(
                    icon: Icon(
                      Icons.share,
                      color: primaryColor,
                    ),
                    onPressed: () {
                      showToast("share clicked");
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: textColor,
        ),
        onPressed: () {},
      ),
      backgroundColor: Colors.white,
      actions: <Widget>[
        ShoppingCartBadge(
            counter: 5,
            onPress: () {
              showToast("this is a msg");
            }),
      ],
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 8,
      width: currentPage == index ? 20 : 8,
      decoration: BoxDecoration(
        color: currentPage == index ? primaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
