import 'package:flutter/material.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';

class RoundedPasswordTextFormField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String hint;

  const RoundedPasswordTextFormField({Key key, this.onChanged, this.hint})
      : super(key: key);

  @override
  _RoundedPasswordTextFormFieldState createState() =>
      _RoundedPasswordTextFormFieldState();
}

class _RoundedPasswordTextFormFieldState
    extends State<RoundedPasswordTextFormField> {
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
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: primaryColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: primaryColor)),
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
