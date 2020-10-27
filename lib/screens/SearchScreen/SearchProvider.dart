import 'package:flutter/material.dart';

class SearchProvider with ChangeNotifier {
  SearchProvider();

  BuildContext context;

  void setView(BuildContext context) => this.context = context;

  TextEditingController searchController = TextEditingController();
}
