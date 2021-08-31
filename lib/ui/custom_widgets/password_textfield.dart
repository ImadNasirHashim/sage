import 'package:flutter/material.dart';
import 'package:sage/core/constants/styles.dart';

class PasswordTextField extends StatelessWidget {

  final onChanged;
  final validator;
  final controller;
  final hintText;


  PasswordTextField({
    this.onChanged,
    this.controller,
    this.validator,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: textFiledContainerStyle,
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        controller: controller,
        obscureText: true,
        obscuringCharacter: "*",
        decoration:InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            fillColor: Colors.white,
            filled: true,
            hintText: '$hintText',
            prefixIcon: Icon(Icons.lock),
            suffixIcon: ImageIcon(
              AssetImage('assets/icons/sent_icon.png'),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide.none
            )
        ),
      ),
    );
  }
}
