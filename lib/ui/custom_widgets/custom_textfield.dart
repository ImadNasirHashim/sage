import 'package:flutter/material.dart';
import 'package:sage/core/constants/styles.dart';

class CustomTextField extends StatelessWidget {

  final onChanged;
  final validator;
  final hintText;
  final controller;
  final preFixIcon;
  final sufFixIcon;


  CustomTextField({this.preFixIcon,
    this.sufFixIcon,
    this.onChanged,
    this.controller,
    this.hintText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: textFiledContainerStyle,
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        controller: controller,
        decoration:InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          hintText: '$hintText',
          prefixIcon: Icon(preFixIcon),
          suffixIcon: sufFixIcon != null ? ImageIcon(
            AssetImage(sufFixIcon),) : SizedBox(height: 0, width: 0,),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide.none
          ),
        ),
      ),
    );
  }
}
