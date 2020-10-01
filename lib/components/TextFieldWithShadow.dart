import 'package:flutter/material.dart';

class TextFieldWithShadow extends StatelessWidget {
  final String hintText;

  const TextFieldWithShadow({Key key, this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: '$hintText',
            hintStyle: TextStyle(
                letterSpacing: 2,
                color: Colors.black54,
                fontWeight: FontWeight.bold),
            fillColor: Colors.white30,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none)),
      ),
    );
  }
}
