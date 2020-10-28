import 'package:flutter/material.dart';
import 'package:sx_commerece/Utils/mColor.dart';

class SearchTextField extends StatelessWidget {
   SearchTextField({
    Key key,
    @required this.controller,
     @required this.onPress
    }) :super(key: key);

   TextEditingController controller;
   Function onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:15,right: 10,left: 10),
      child: Material(
        elevation: 2,
        shadowColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: TextFormField(
            controller:controller,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
                hintText: 'Find your product',
                isDense: true, // important line
                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),// control your hints text size
                suffixIcon: Container(
                  decoration: BoxDecoration(
                      color: textColor
                  ),
                  child: IconButton(
                    onPressed: onPress,
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
                hintStyle: TextStyle(letterSpacing: 2, color: Colors.black54, fontWeight: FontWeight.bold),
                fillColor: Colors.white30,
                filled: true,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none)),
          ),
        ),
      ),
    );
  }
}