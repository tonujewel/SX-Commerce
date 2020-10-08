import 'package:flutter/material.dart';

class TextFieldWithShadow extends StatelessWidget {
   String hintText;
   String label;
  TextEditingController controller;

  TextFieldWithShadow({Key key,@required this.controller, this.hintText,this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: TextFormField(
          controller: controller,
          keyboardType:TextInputType.text,
          decoration: InputDecoration(
              hintText: hintText,
              labelText: label,
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
      ),
    );
  }
}
