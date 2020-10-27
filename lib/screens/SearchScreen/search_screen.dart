import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
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
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: Icon(Icons.arrow_back, color: textColor,),
              title: Text('Search',style: TextStyle(color: textColor),),
            ),
            body: Container(
              height: size.height,
              width: size.width,
              child: Column(
                children: [
                  SizedBox(height: size.height * .06),
                  TextFieldWithShadow(
                    hintText: "Search your product",
                    controller: searchProvider.searchController,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
