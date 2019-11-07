import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  SubmitButton({this.onPressed, this.text});

  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
