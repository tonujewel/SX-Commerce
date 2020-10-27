import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/screens/product_details/ProductDetailsProvider.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> with SingleTickerProviderStateMixin {
  int currentPage = 0;
  ProductDetailsProvider productDetailsProvider;

  TabController _tabController;
  double containerWidth, containerHeight;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<ProductDetailsProvider>(
      create: (_) => ProductDetailsProvider()..setView(context),
      child: Consumer<ProductDetailsProvider>(builder: (context, model, child) {
        productDetailsProvider = model;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: Stack(
            children: [
              Column(
                children: [
                  topImageSlider(size),
                  priceRating(),
                  name(),
                  divider(),
                  TabBar(
                    unselectedLabelColor: Colors.black,
                    indicatorColor: Colors.transparent,
                    labelColor: primaryColor,
                    tabs: [
                      Tab(child: tabItems("Product")),
                      Tab(child: tabItems("Details")),
                      Tab(child: tabItems("Reviews"))
                    ],
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        productContainer(size),
                        detailsContainer(size),
                        reviewsList(size),
                      ],
                      controller: _tabController,
                    ),
                  ),
                ],
              ),
              bottomContainer(size)
            ],
          ),
        );
      }),
    );
  }

  Padding reviewsList(Size size) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60),
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, indext) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: 10,
                top: 10,
              ),
              child: Container(
                height: size.height * 0.16,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: primaryShadow),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFECEFF1),
                          borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(10), bottomLeft: const Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child:
                            Image.asset('assets/images/boy.png', height: size.height * 0.15, width: size.width * 0.28),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Jewel Rana',
                                  style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis),
                              Text('10-12-2020', style: TextStyle(color: textColor), overflow: TextOverflow.ellipsis),
                              Text(
                                "Nice product, perfect size. and comfortable to use ",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: textColor),
                              ),
                              Row(
                                children: [
                                  RatingBar.readOnly(
                                    initialRating: 4.5,
                                    isHalfAllowed: true,
                                    halfFilledIcon: Icons.star_half,
                                    filledIcon: Icons.star,
                                    emptyIcon: Icons.star_border,
                                    size: 20,
                                  ),
                                ],
                              ),
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
    );
  }

  Padding detailsContainer(Size size) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [leftColumn('Band', "Freeland Garments"), rightColumn('SKU', '05904589024136')],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [leftColumn('Category', "Men T-Shirt "), rightColumn('Material', 'Not Specified')],
          ),
          SizedBox(height: 10),
          Text('Specifications', style: TextStyle(fontSize: 18, color: textColor, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style: TextStyle(
                color: textColor,
              )),
          SizedBox(height: size.height * 0.08),
        ],
      ),
    );
  }

  Column rightColumn(String name, value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '$name',
          style: TextStyle(color: textColor),
        ),
        Text(
          '$value',
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Column leftColumn(String name, value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$name',
          style: TextStyle(color: textColor),
        ),
        Text(
          '$value',
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Padding productContainer(Size size) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ListView(
        children: [
          Text(
            'Select Color',
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Container(
                height: size.height * 0.1,
                width: size.width * 0.1,
                decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: size.height * 0.1,
                width: size.width * 0.1,
                decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: size.height * 0.1,
                width: size.width * 0.1,
                decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle),
              ),
            ],
          ),
          Text(
            'Select Size',
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Container(
                height: size.height * 0.1,
                width: size.width * 0.1,
                decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                child: Center(
                    child: Text(
                  '5.5',
                  style: TextStyle(color: Colors.white),
                )),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: size.height * 0.1,
                width: size.width * 0.1,
                decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                child: Center(
                    child: Text(
                  '6.5',
                  style: TextStyle(color: Colors.white),
                )),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: size.height * 0.1,
                width: size.width * 0.1,
                decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                child: Center(
                    child: Text(
                  '7.5',
                  style: TextStyle(color: Colors.white),
                )),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: size.height * 0.1,
                width: size.width * 0.1,
                decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                child: Center(
                    child: Text(
                  '8.5',
                  style: TextStyle(color: Colors.white),
                )),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          )
        ],
      ),
    );
  }

  Positioned bottomContainer(Size size) {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: size.width * .45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FlatButton(
                        onPressed: () {
                          productDetailsProvider.addCartAction();
                        },
                        child: Text(
                          "Add To Cart",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: primaryColor,
                          ),
                        )),
                  ),
                ),
                Container(
                  width: size.width * .45,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FlatButton(
                      color: primaryColor,
                      onPressed: () {
                        productDetailsProvider.buyNowAction();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Center(
                            child: Text(
                          "Buy Now",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Container tabItems(String name) {
    return Container(
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(20), boxShadow: primaryShadow),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
        child: Text('$name'),
      ),
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
          Text("Black T-shirt ", style: TextStyle(fontSize: 16, color: textColor, fontWeight: FontWeight.bold)),
          Text("In Stock", style: TextStyle(color: primaryColor)),
        ],
      ),
    );
  }

  Padding priceRating() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "\$199.99",
            style: TextStyle(fontSize: 16, color: primaryColor, fontWeight: FontWeight.bold),
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
            height: size.height * .25,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: imageBg),
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
                      height: size.height * .2,
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
                children: List.generate(productDetails.length, (index) => buildDot(index: index)),
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
      title: Text(
        'Product Details',
        style: TextStyle(color: textColor),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: textColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Colors.white,

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
