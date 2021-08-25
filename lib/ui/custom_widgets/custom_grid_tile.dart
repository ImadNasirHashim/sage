import 'package:flutter/material.dart';
import 'package:sage/core/constants/colors.dart';

class CustomGridTile extends StatelessWidget {
  final onPressed;
  final title;
  final String? icon;

  CustomGridTile({this.onPressed, this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: MediaQuery.of(context).size.width * 0.4,
        width: MediaQuery.of(context).size.width * 0.45,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
          child: Card(
            color: backgroundColor,
            shadowColor: Colors.grey,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: GridTile(
                child: Image.asset('assets/icons/${icon!}'),
                footer: Text(title,textAlign: TextAlign.center,),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

