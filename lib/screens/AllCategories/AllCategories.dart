import 'package:flutter/material.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/Utils/mColor.dart';

class AllCategories extends StatefulWidget {
  @override
  _AllCategoriesState createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            Container(
              height: size.height ,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
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
                    ],
                  );
                },
              ),
            ),
            Container(
              height: size.height,
              decoration: BoxDecoration(
                color: Colors.red
              ),
              child: Text('jewel'),
            )
          ],
        ),
      ),
    );
  }
}
