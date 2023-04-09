import 'package:flutter/material.dart';

class TextManager extends StatelessWidget {
  String message;
  TextManager({required this.message});

  @override
  Widget build(BuildContext context) {
    return Text(message,
        style: TextStyle(
          fontFamily: 'VarelaRound',
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ));
  }
}
