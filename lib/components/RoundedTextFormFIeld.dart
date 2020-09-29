import 'package:flutter/material.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';

class RoundedTextFormField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hints;
  const RoundedTextFormField({this.hints, this.onChanged});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      decoration: new InputDecoration(
        labelText: '$hints',
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: primaryColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: primaryColor)),
      ),
    );
  }
}
