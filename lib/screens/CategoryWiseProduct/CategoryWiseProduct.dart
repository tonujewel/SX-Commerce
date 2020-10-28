import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/Utils/mColor.dart';
import 'package:sx_commerece/screens/CategoryWiseProduct/CategoryWiseProductProvider.dart';

class CategoryWiseProduct extends StatefulWidget {

  String productName;

  CategoryWiseProduct({String this.productName});


  @override
  _CategoryWiseProductState createState() => _CategoryWiseProductState();
}

class _CategoryWiseProductState extends State<CategoryWiseProduct> {
  CategoryWiseProductProvider provider;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<CategoryWiseProductProvider>(
        create: (_)=>CategoryWiseProductProvider()..setView(context),
      child: Consumer<CategoryWiseProductProvider>(
        builder: (context, model, child){
          provider = model;
          return Scaffold(
            appBar: appBar(),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  itemCount: searchResultList.length,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return new GestureDetector(
                      onTap: () {
                      //  searchProvider.goToProductDetailsPage();
                      },
                      child: new Card(
                        elevation: 5.0,
                        child: new Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Image.asset(
                                searchResultList[index]['image'],
                                height: size.height * .15,
                                width: size.width,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8, right: 8,top: 8),
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: RichText(
                                        text: TextSpan(
                                          style: TextStyle(color: textColor),
                                          text: "${searchResultList[index]["name"]}",
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8, right: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: RichText(
                                        text: TextSpan(
                                          style: TextStyle(color: textColor, fontSize: 16),
                                          text: searchResultList[index]['price'],
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
                                            "5.0",
                                            maxLines: 1,
                                            style: TextStyle(color: Colors.white, fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                    );
                  }),
            ),

          );
        }
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
        widget.productName,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
