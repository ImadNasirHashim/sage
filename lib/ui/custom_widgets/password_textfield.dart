import 'package:flutter/material.dart';

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
    return Material(
      elevation: 20.0,
      shadowColor: Colors.grey,
      borderRadius: BorderRadius.circular(7),
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        controller: controller,
        obscureText: true,
        obscuringCharacter: "*",
        decoration:InputDecoration(
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
