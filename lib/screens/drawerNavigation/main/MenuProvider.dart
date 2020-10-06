import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'file:///D:/SoftX/Flutter%20project/sx_commerece/sx_commerece/lib/screens/drawerNavigation/main/MainDrawerProvider.dart';
import 'package:sx_commerece/screens/drawerNavigation/payment/PaymentScreen.dart';

class MenuProvider with ChangeNotifier{

  BuildContext context;
  MenuProvider();
  void setView(BuildContext context) => this.context = context;

  int _currentPage = 0;
  int newCurrentPage = 0 ;
  int get currentPage => _currentPage;

  void updateCurrentPage(int index) {
    if (index != currentPage) {
      _currentPage = index;
      notifyListeners();
    }
  }

  void drawerNavigation(){
    if(newCurrentPage==0){
      Provider.of<MainDrawerProvider>(context, listen: false).toggleDrawer(newCurrentPage);
      notifyListeners();
    }else if(newCurrentPage==1){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentScreen()));
      Provider.of<MainDrawerProvider>(context, listen: false).toggleDrawer(newCurrentPage);
      notifyListeners();
    }


  }
  void showToast(){
    Fluttertoast.showToast(
        msg: "$newCurrentPage",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    Provider.of<MainDrawerProvider>(context, listen: false).toggleDrawer(newCurrentPage);
    notifyListeners();
  }


}