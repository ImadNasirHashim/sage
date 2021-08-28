import 'package:flutter/material.dart';
import 'package:sage/core/constants/colors.dart';
import 'package:sage/core/constants/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionContainer extends StatelessWidget {
  final button;
  final title;
  final questionNo;

  QuestionContainer({this.questionNo,this.title,this.button});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 9.0,vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 130.h,
        decoration: questionStyle,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                ///
                /// Question number
                ///
                Container(
                  height: 20.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(2)
                  ),
                  child: Center(
                    child: Text(
                      '$questionNo',
                      style: TextStyle(color: Colors.white,fontSize: 16.sp),
                    ),
                  ),
                ),
                SizedBox(width: 14.h,),
                ///
                /// Question title
                ///
                Expanded(child: Text(title)),
              ],
            ),
            SizedBox(height: 30.h,),
            ///
            /// button
            ///
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: button,
            ),
          ],
        ),
      ),
    );
  }
}
