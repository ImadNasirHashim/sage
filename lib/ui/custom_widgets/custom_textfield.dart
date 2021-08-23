import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final onChanged;
  final validator;
  final hintText;
  final controller;
  final  preFixIcon;
  final sufFixIcon;


  CustomTextField({this.preFixIcon,
    this.sufFixIcon,
    this.onChanged,
    this.controller,
    this.hintText,
    this.validator});

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Colors.grey,
      elevation: 20,
      borderRadius: BorderRadius.circular(7),
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        controller: controller,
        decoration:InputDecoration(
          hintText: '$hintText',
          prefixIcon: Icon(preFixIcon),
          suffixIcon: ImageIcon(
            AssetImage(sufFixIcon),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide.none
          ),
        ),
      ),
    );
  }
}
