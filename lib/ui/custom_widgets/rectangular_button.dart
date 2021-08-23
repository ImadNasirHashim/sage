import 'package:flutter/material.dart';
import 'package:sage/core/constants/colors.dart';

class RectangularButton extends StatelessWidget {

  final title;
  final onPressed;

  RectangularButton({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Center(
          child: Text(
            '$title',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
