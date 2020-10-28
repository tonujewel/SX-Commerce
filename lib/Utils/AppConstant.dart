import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sx_commerece/Utils/mColor.dart';
import 'package:sx_commerece/main.dart';

// On board slider
List<Map<String, String>> onBoardData = [
  {"text": language.sliderTextOne, "image": "assets/images/one.png"},
  {"text": language.sliderTextTwo, "image": "assets/images/two.png"},
  {"text": language.sliderTextThree, "image": "assets/images/three.png"},
];

// On board slider
List<Map> productDetails = [
  {"image": "assets/images/t_shirt.png"},
  {"image": "assets/images/shoe_colored.png"},
  {"image": "assets/images/redmi_monitor.png"},
];

// shadow
List<BoxShadow> shadow = [
  BoxShadow(
    color: Color(0xFF90CAF9),
    blurRadius: 5.0,
    spreadRadius: 2.0,
  )
];

List<BoxShadow> primaryShadow = [
  BoxShadow(
    color: Color(0xFF90CAF9),
    blurRadius: 2.0,
    spreadRadius: 2.0,
  )
];

List<BoxShadow> greyShadow = [
  BoxShadow(
    color: Colors.grey[300],
    blurRadius: 30,
    offset: Offset(0, 10),
  ),
];

// carousel home page
List<Map> carouselCategories = [
  {"image": "assets/images/one.png"},
  {"image": "assets/images/two.png"},
  {"image": "assets/images/three.png"},
];

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

//................... notification list  ................
List<Map> notificationLIst = [
  {"title": "First Notification", "description": "First sub title", "image": "assets/images/one.png"},
  {"title": "Second Notification", "description": "Second sub title", "image": "assets/images/two.png"},
  {"title": "Third Notification", "description": "Third sub title", "image": "assets/images/three.png"},
];

//................... Home page category list  ................
List<Map> categoryList = [
  {"id": "1", "name": 'Pants', "image": "assets/images/pants.png"},
  {"id": "2", "name": 'Shirts', "image": "assets/images/shirt.png"},
  {"id": "3", "name": 'Laptops', "image": "assets/images/laptop.png"},
  {"id": "4", "name": 'Desktop', "image": "assets/images/desktop.png"},
  {"id": "5", "name": 'Mobile', "image": "assets/images/mobile.png"},
  {"id": "5", "name": 'Shoes', "image": "assets/images/shoe.png"},
  {"id": "5", "name": 'Watches', "image": "assets/images/watch.png"},
];
List<Map> imageList = [
  {"image": "assets/images/t_shirt.png"},
  {"image": "assets/images/t_shirt.png"},
  {"image": "assets/images/t_shirt.png"},
  {"image": "assets/images/t_shirt.png"},
  {"image": "assets/images/t_shirt.png"},
  {"image": "assets/images/t_shirt.png"},
];

//................... New product list  ................
List<Map> newProductList = [
  {
    "id": "0",
    "name": 'Black T-shirt',
    "image": "assets/images/t_shirt.png",
    "price": "\$500",
    "rating": 5.0,
    "isFavorite": true,
    "discount": "\$700"
  },
  {
    "id": "1",
    "name": 'iMac 2020 ',
    "image": "assets/images/imac.png",
    "price": "\$2700",
    "rating": 3.0,
    "isFavorite": false,
    "discount": "\$3000"
  },
  {
    "id": "2",
    "name": 'Adidas shoe - blue ',
    "image": "assets/images/shoe_colored.png",
    "price": "\$430",
    "rating": 4.0,
    "isFavorite": true,
    "discount": "\$700"
  },
  {
    "id": "4",
    "name": 'Redmi Display 1A Monitor 23.8- Inch Full HD IPS',
    "image": "assets/images/redmi_monitor.png",
    "price": "\$1050",
    "rating": 4.5,
    "isFavorite": true,
    "discount": "\$1170"
  },
  {
    "id": "5",
    "name": 'Mackbook Pro 2020',
    "image": "assets/images/macbook_pro.png",
    "price": "\$1050",
    "rating": 4.0,
    "isFavorite": true,
    "discount": "\$1700"
  },
];

//................... New product list  ................
List<Map> searchResultList = [
  {
    "id": "1",
    "name": 'iMac 2020 ',
    "image": "assets/images/imac.png",
    "price": "\$2700",
    "rating": 3.0,
    "isFavorite": false,
    "discount": "\$3000"
  },
  {
    "id": "2",
    "name": 'Adidas shoe - blue ',
    "image": "assets/images/shoe_colored.png",
    "price": "\$430",
    "rating": 4.0,
    "isFavorite": true,
    "discount": "\$700"
  },
  {
    "id": "0",
    "name": 'Black T-shirt',
    "image": "assets/images/t_shirt.png",
    "price": "\$500",
    "rating": 5.0,
    "isFavorite": true,
    "discount": "\$700"
  },
  {
    "id": "4",
    "name": 'Redmi Display 1A Monitor 23.8- Inch Full HD IPS',
    "image": "assets/images/redmi_monitor.png",
    "price": "\$1050",
    "rating": 4.5,
    "isFavorite": true,
    "discount": "\$1170"
  },
  {
    "id": "0",
    "name": 'Black T-shirt',
    "image": "assets/images/t_shirt.png",
    "price": "\$500",
    "rating": 5.0,
    "isFavorite": true,
    "discount": "\$700"
  },
  {
    "id": "2",
    "name": 'Adidas shoe - blue ',
    "image": "assets/images/shoe_colored.png",
    "price": "\$430",
    "rating": 4.0,
    "isFavorite": true,
    "discount": "\$700"
  },
  {
    "id": "5",
    "name": 'Mackbook Pro 2020',
    "image": "assets/images/macbook_pro.png",
    "price": "\$1050",
    "rating": 4.0,
    "isFavorite": true,
    "discount": "\$1700"
  },
  {
    "id": "1",
    "name": 'iMac 2020 ',
    "image": "assets/images/imac.png",
    "price": "\$2700",
    "rating": 3.0,
    "isFavorite": false,
    "discount": "\$3000"
  },
  {
    "id": "2",
    "name": 'Adidas shoe - blue ',
    "image": "assets/images/shoe_colored.png",
    "price": "\$430",
    "rating": 4.0,
    "isFavorite": true,
    "discount": "\$700"
  },
  {
    "id": "0",
    "name": 'Black T-shirt',
    "image": "assets/images/t_shirt.png",
    "price": "\$500",
    "rating": 5.0,
    "isFavorite": true,
    "discount": "\$700"
  },
  {
    "id": "4",
    "name": 'Redmi Display 1A Monitor 23.8- Inch Full HD IPS',
    "image": "assets/images/redmi_monitor.png",
    "price": "\$1050",
    "rating": 4.5,
    "isFavorite": true,
    "discount": "\$1170"
  },
  {
    "id": "0",
    "name": 'Black T-shirt',
    "image": "assets/images/t_shirt.png",
    "price": "\$500",
    "rating": 5.0,
    "isFavorite": true,
    "discount": "\$700"
  },
  {
    "id": "2",
    "name": 'Adidas shoe - blue ',
    "image": "assets/images/shoe_colored.png",
    "price": "\$430",
    "rating": 4.0,
    "isFavorite": true,
    "discount": "\$700"
  },
  {
    "id": "5",
    "name": 'Mackbook Pro 2020',
    "image": "assets/images/macbook_pro.png",
    "price": "\$1050",
    "rating": 4.0,
    "isFavorite": true,
    "discount": "\$1700"
  },
];

List<Map> cartList = [
  {
    "id": "0",
    "name": 'Black T-shirt',
    "image": "assets/images/t_shirt.png",
    "price": "\$500",
    "rating": 5.0,
    "isFavorite": true,
    "discount": "\$700"
  },
  {
    "id": "1",
    "name": 'iMac 2020 ',
    "image": "assets/images/imac.png",
    "price": "\$2700",
    "rating": 3.0,
    "isFavorite": false,
    "discount": "\$3000"
  },
  {
    "id": "2",
    "name": 'Adidas shoe - blue ',
    "image": "assets/images/shoe_colored.png",
    "price": "\$430",
    "rating": 4.0,
    "isFavorite": true,
    "discount": "\$700"
  },
  {
    "id": "4",
    "name": 'Redmi Display 1A Monitor 23.8- Inch Full HD IPS',
    "image": "assets/images/redmi_monitor.png",
    "price": "\$1050",
    "rating": 4.5,
    "isFavorite": true,
    "discount": "\$1170"
  },
  {
    "id": "5",
    "name": 'Mackbook Pro 2020',
    "image": "assets/images/macbook_pro.png",
    "price": "\$1050",
    "rating": 4.0,
    "isFavorite": true,
    "discount": "\$1700"
  },
];
List<Map> orderList = [
  {
    "id": "0",
    "name": 'Black T-shirt',
    "image": "assets/images/t_shirt.png",
    "price": "\$500",
    "rating": 5.0,
    "isFavorite": true,
    "discount": "\$700"
  },
  {
    "id": "1",
    "name": 'iMac 2020 ',
    "image": "assets/images/imac.png",
    "price": "\$2700",
    "rating": 3.0,
    "isFavorite": false,
    "discount": "\$3000"
  },
  {
    "id": "2",
    "name": 'Adidas shoe - blue ',
    "image": "assets/images/shoe_colored.png",
    "price": "\$430",
    "rating": 4.0,
    "isFavorite": true,
    "discount": "\$700"
  },
  {
    "id": "4",
    "name": 'Redmi Display 1A Monitor 23.8- Inch Full HD IPS',
    "image": "assets/images/redmi_monitor.png",
    "price": "\$1050",
    "rating": 4.5,
    "isFavorite": true,
    "discount": "\$1170"
  },
  {
    "id": "5",
    "name": 'Mackbook Pro 2020',
    "image": "assets/images/macbook_pro.png",
    "price": "\$1050",
    "rating": 4.0,
    "isFavorite": true,
    "discount": "\$1700"
  },
];

class MenuItem {
  final String title;
  final IconData icon;
  final int index;

  const MenuItem(this.title, this.icon, this.index);
}

void showToast(String msg) {
  Fluttertoast.showToast(
      msg: "$msg",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: primaryColor,
      textColor: Colors.white,
      fontSize: 16.0);
}

double marginTop = 0.02;

String dollarSign = String.fromCharCodes(new Runes('\u0024'));

String heroTag = '';

// Delivery status
List deliverySteps = [
  'Order Placed',
  'Invoice',
  'Pick and pack',
  'Delivery',
];
