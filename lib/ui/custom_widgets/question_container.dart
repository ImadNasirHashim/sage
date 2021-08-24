import 'package:flutter/material.dart';
import 'package:sage/core/constants/colors.dart';
import 'package:sage/core/constants/styles.dart';

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
        padding: EdgeInsets.all(10),
        height: 150,
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
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(2)
                  ),
                  child: Center(
                    child: Text(
                      '$questionNo',
                      style: TextStyle(color: Colors.white,fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(width: 14,),
                ///
                /// Question title
                ///
                Expanded(child: Text(title)),
              ],
            ),
            SizedBox(height: 20,),
            ///
            /// button
            ///
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: button,
            ),
          ],
        ),
      ),
    );
  }
}
