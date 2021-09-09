import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPercentageIndicator extends StatelessWidget {
  final percentage;
  final centreText;
  final progressColor;

  CustomPercentageIndicator({this.percentage,this.centreText,this.progressColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CircularPercentIndicator(
        radius: 100.0.r,
        animation: true,
        animationDuration: 1200,
        lineWidth: 8.0,
        percent: percentage,
        center: Text(
          centreText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10.0.sp,
          ),
        ),
        circularStrokeCap: CircularStrokeCap.butt,
        backgroundColor: Colors.white,
        progressColor: progressColor,
      ),
    );
  }
}
