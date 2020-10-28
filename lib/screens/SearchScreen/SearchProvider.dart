import 'package:flutter/material.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/screens/product_details/ProductDetails.dart';

class SearchProvider with ChangeNotifier {
  SearchProvider();

  BuildContext context;
  bool searchClicked = false;

  void setView(BuildContext context) => this.context = context;

  TextEditingController searchController = TextEditingController();

  //bak press
  backPress() {
    Navigator.pop(context);
  }

  // Product details page
  goToProductDetailsPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails()));
  }

  // search actions
  void searchAction() {
    searchClicked = !searchClicked;
    debugPrint('items:  $searchClicked');
    notifyListeners();
  }

  // function for disable and enbale
  int searchItemsCount() {
    if (searchClicked == true) {
      return searchResultList.length;
    } else {
      return 0;
    }
  }
}
