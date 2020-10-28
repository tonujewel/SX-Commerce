import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/Utils/mColor.dart';
import 'package:sx_commerece/screens/AllCategories/AllCategoriesProvider.dart';

class AllCategories extends StatefulWidget {
  @override
  _AllCategoriesState createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  AllCategoriesProvider provider;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<AllCategoriesProvider>(
      create: (_) => AllCategoriesProvider()..setView(context),
      child: Consumer<AllCategoriesProvider>(
        builder: (context, model, child) {
          provider = model;
          return Scaffold(
            appBar: appBar(),
            body: Row(
              children: [
                categoryListContainer(size),
                productListContainer(size),
              ],
            ),
          );
        },
      ),
    );
  }

  Material productListContainer(Size size) {
    return Material(
      elevation: 4,
      child: Container(
        height: size.height,
        width: size.width * 0.67,
        margin: EdgeInsets.only(left:10,top: 5,bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
         // boxShadow: greyShadow
        ),
        child: Column(
          children: [
            Text('Pants', style: TextStyle(color: textColor, fontWeight: FontWeight.bold),),
            Expanded(
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: searchResultList.length,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return new GestureDetector(
                      onTap: () {
                        //searchProvider.goToProductDetailsPage();
                      },
                      child: new Card(
                        elevation: 4.0,
                        child: new Container(
                          margin: EdgeInsets.all( 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                searchResultList[index]['image'],
                                height: size.height * .08,
                                width: size.width,
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 4.0, top: 4),
                                      child: RichText(
                                        textAlign: TextAlign.start,
                                        text: TextSpan(
                                          style: TextStyle(color: textColor),
                                          text: "${searchResultList[index]["name"]}",
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 4.0, top: 4),
                                  child: RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                      style: TextStyle(color: textColor),
                                      text: "${searchResultList[index]["price"]}",
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Material categoryListContainer(Size size) {
    return Material(
      elevation: 4,
      child: Container(
        height: size.height,
        width: size.width * 0.26,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)
        ),
        child: ListView.builder(
          itemCount: categoryList.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(left: 5, right: 5, top: 5),
              padding: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: greyShadow
              ),
              child: Column(
                children: [
                  Image.asset(
                    '${categoryList[index]['image']}',
                    height: size.height * .15,
                    width: size.width * .2,
                    color: primaryColor,
                  ),
                  Text(
                    categoryList[index]['name'],
                    style: TextStyle(color: primaryColor),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () {
          provider.backPress();
        },
        child: Icon(
          Icons.arrow_back,
          color: textColor,
        ),
      ),
      title: Text(
        'All Categories',
        style: TextStyle(color: textColor),
      ),
    );
  }
}
