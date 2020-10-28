import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PasswordTextFieldWithShadow extends StatefulWidget {
  String hintText;
  String label;
  TextEditingController controller;

  PasswordTextFieldWithShadow({Key key, @required this.controller, this.hintText, this.label}) : super(key: key);

  @override
  _PasswordTextFieldWithShadowState createState() => _PasswordTextFieldWithShadowState();
}

class _PasswordTextFieldWithShadowState extends State<PasswordTextFieldWithShadow> {
  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      shadowColor: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: TextFormField(
          controller: widget.controller,
          obscureText: _showPassword,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
              hintText: widget.hintText,
              labelText: widget.label,
              isDense: true, // important line
              contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),// control your hints text size
              suffixIcon: IconButton(
                onPressed: () {
                  _showPassword = !_showPassword;
                  print(_showPassword);
                  setState(() {});
                },
                icon: Icon(
                  !_showPassword ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black54,
                ),
              ),
              hintStyle: TextStyle(letterSpacing: 2, color: Colors.black54, fontWeight: FontWeight.bold),
              fillColor: Colors.white30,
              filled: true,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}
