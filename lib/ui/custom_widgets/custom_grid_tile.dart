import 'package:flutter/material.dart';
import 'package:sage/core/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGridTile extends StatelessWidget {
  final onPressed;
  final title;
  final String? icon;

  CustomGridTile({this.onPressed, this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 150.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
          child: GestureDetector(
            onTap: onPressed,
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
      ),
    );
  }
}

