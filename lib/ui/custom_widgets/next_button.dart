import 'package:flutter/material.dart';
import 'package:sage/core/constants/colors.dart';

class CustomNextButton extends StatelessWidget {
  final title;
  final IconData? icon;
  final onPressed;

  CustomNextButton({this.title,this.icon,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title,style: TextStyle(color: Colors.white),),
                SizedBox(width: 4,),
                Icon(icon,color: Colors.white,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
