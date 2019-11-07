import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  Input(
      {@required this.controller,
      @required this.validator,
      @required this.hint,
      @required this.hideText,
      this.icon});

  final TextEditingController controller;
  final String Function(String) validator;
  final String hint;
  final bool hideText;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextFormField(
      controller: controller,
      autofocus: false,
      obscureText: hideText,
      validator: validator,
      decoration: InputDecoration(
          hintText: hint,
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          prefixIcon: icon),
    ));
  }
}
