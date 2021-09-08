import 'package:flutter/material.dart';
import 'package:sage/core/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackButton extends StatelessWidget {
  final title;
  final IconData? icon;
  final onPressed;
  final size;
  final color;

  CustomBackButton({this.title, this.icon, this.onPressed, this.size,this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 35.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: size ?? 16,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
