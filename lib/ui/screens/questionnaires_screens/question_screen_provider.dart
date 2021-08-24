import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sage/core/view_models/base_view_model.dart';

class QuestionScreenProvider extends BaseViewModal{
  double  sliderValue = 0;
  double sliderMinValue = 0;
  double sliderMaxvalue = 100;

  changeSliderValue(double value){
    sliderValue = value;
    print(sliderValue);
    notifyListeners();
  }

  setTimeForReminder(BuildContext context){
    Get.defaultDialog(
        title: 'Journal reminder',
        content: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          child: CupertinoDatePicker(
            minuteInterval: 1,
            mode: CupertinoDatePickerMode.time,
            onDateTimeChanged: (DateTime dateTime) {
              print("dateTime: ${dateTime}");
            },
          ),
        )
    );
  }
}