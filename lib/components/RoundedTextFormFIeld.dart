import 'package:flutter/material.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';

class RoundedTextFormField extends StatelessWidget {
  ValueChanged<String> onChanged;
  String hints;
  Widget prefix;

  RoundedTextFormField({this.hints, this.prefix, @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      decoration: new InputDecoration(
        prefixIcon: prefix != null ? prefix : null,
        labelText: '$hints',
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)), borderSide: BorderSide(color: primaryColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)), borderSide: BorderSide(color: primaryColor)),
      ),
    );
  }
}
