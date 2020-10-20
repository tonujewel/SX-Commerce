import 'package:flutter/cupertino.dart';

class FavoriteProvider with ChangeNotifier{

  BuildContext context;

  FavoriteProvider();

  void setView(BuildContext context) => this.context = context;
}