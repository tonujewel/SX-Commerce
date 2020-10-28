import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldWithShadow extends StatelessWidget {
  String hintText;
  String label;
  TextEditingController controller;
  Color mFillColor;
  double radius;

  TextFieldWithShadow({Key key, @required this.controller, this.hintText, this.label, this.mFillColor,this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      shadowColor: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius==null?10:radius)),
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              hintText: hintText,
              labelText: label,
              isDense: true,
              contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              hintStyle: TextStyle(letterSpacing: 2, color: Colors.black54, fontWeight: FontWeight.bold),
              fillColor: mFillColor == null ? Colors.white30 : mFillColor,
              filled: true,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}
