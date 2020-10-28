import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/Dimension/Dimension.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/components/SearchTextField.dart';
import 'package:sx_commerece/components/TextFieldWithShadow.dart';
import 'package:sx_commerece/screens/SearchScreen/SearchProvider.dart';
import 'package:sx_commerece/Utils/mColor.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchProvider searchProvider;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<SearchProvider>(
      create: (_) => SearchProvider()..setView(context),
      child: Consumer<SearchProvider>(
        builder: (context, model, child) {
          searchProvider = model;
          return Scaffold(
            appBar: appBar(),
            body: Container(
              height: size.height,
              width: size.width,
              child: Column(
                children: [
                  SearchTextField(
                    controller: searchProvider.searchController,
                    onPress: () {
                      searchProvider.searchAction();
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                          itemCount: searchProvider.searchItemsCount(),
                          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                          itemBuilder: (BuildContext context, int index) {
                            return new GestureDetector(
                              onTap: () {
                                searchProvider.goToProductDetailsPage();
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
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () {
          searchProvider.backPress();
        },
        child: Icon(
          Icons.arrow_back,
          color: textColor,
        ),
      ),
      title: Text(
        'Search',
        style: TextStyle(color: textColor),
      ),
    );
  }
}
