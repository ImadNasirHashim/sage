import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final questionStyle = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(7),
    boxShadow: [
      BoxShadow(
          offset: Offset(0.0,3),
          spreadRadius: 3,
          blurRadius: 4,
          color: Colors.grey,
      ),
    ]
);

final textFiledContainerStyle = BoxDecoration(
  color:Colors.white,
  borderRadius: BorderRadius.circular(7),
  boxShadow:[
    BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 5,
      blurRadius: 7,
      offset: Offset(0, 3),
    ),
  ],
);

final textFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 20),
  hintText: 'Your message',
  border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: BorderSide.none
  ),
);

final appBarShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    bottomRight: Radius.circular(7),
    bottomLeft: Radius.circular(7),
  ),
);

final fontSize16 = TextStyle(fontSize: 16);