import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/constants/constans.dart';

class CustomFormField extends StatelessWidget {
  late final bool obscureText;
  late final String hint;
  TextInputType type;
  int lines;
  IconData icon;
  void Function(String) onChanged;
  CustomFormField(
      {required this.hint,
      required this.lines,
      required this.type,
      required this.obscureText,
      required this.onChanged,
      required this.icon});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        maxLines: lines,
        keyboardType: type,
        scrollPadding: EdgeInsets.only(bottom: 40),
        onChanged: onChanged,
        obscureText: obscureText,
        autofocus: false,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          color: Colors.black,
          fontFamily: 'VarelaRound',
        ),
        decoration: InputDecoration(
          labelStyle: TextStyle(color: kGoogleYellow),
          floatingLabelStyle: TextStyle(color: kGoogleYellow),
          focusColor: kGoogleYellow,
          prefixIcon: Icon(
            icon,
            color: Colors.grey,
            size: 16,
          ),
          fillColor: kGoogleYellow,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Colors.black26,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kGoogleYellow, width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
      ),
    );
  }
}
