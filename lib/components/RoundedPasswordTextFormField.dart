import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';

// ignore: must_be_immutable
class RoundedPasswordTextFormField extends StatefulWidget {
  ValueChanged<String> onChanged;
  String hint;
  Widget prefixIcon;

  RoundedPasswordTextFormField({Key key, @required this.onChanged, this.hint, this.prefixIcon}) : super(key: key);

  @override
  _RoundedPasswordTextFormFieldState createState() => _RoundedPasswordTextFormFieldState();
}

class _RoundedPasswordTextFormFieldState extends State<RoundedPasswordTextFormField> {
  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      obscureText: _showPassword,
      keyboardType: TextInputType.visiblePassword,
      decoration: new InputDecoration(
        labelText: widget.hint,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)), borderSide: BorderSide(color: primaryColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)), borderSide: BorderSide(color: primaryColor)),
        errorBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.red)),
        prefixIcon: widget.prefixIcon != null ? widget.prefixIcon : null,
        suffixIcon: IconButton(
          onPressed: () {
            _showPassword = !_showPassword;
            print(_showPassword);
            setState(() {});
          },
          icon: Icon(
            !_showPassword ? Icons.visibility : Icons.visibility_off,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
