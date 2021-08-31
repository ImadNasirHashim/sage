import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sage/core/view_models/base_view_model.dart';
import 'package:intl/intl.dart';

class QuestionScreenProvider extends BaseViewModal {
  double sliderValue = 0;
  double sliderMinValue = 0;
  double sliderMaxvalue = 90;
  String? setTime;

  QuestionScreenProvider() {
    setTime = "9:00 AM";
  }

  changeSliderValue(double value) {
    double diff = (value - sliderValue).obs();
    if (diff <= 30) {
      sliderValue = value;
    }
    print(sliderValue);
    notifyListeners();
  }

  ///
  /// time alert dialog
  ///
  setTimeForReminder(BuildContext context) {
    Get.defaultDialog(
      onConfirm: () => Navigator.pop(context),
      barrierDismissible: false,
      confirmTextColor: Colors.white,
      textConfirm: 'Done',
      title: 'Journal reminder',
      content: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        child: CupertinoDatePicker(
          minuteInterval: 1,
          mode: CupertinoDatePickerMode.time,
          onDateTimeChanged: (DateTime dateTime) {
            final DateFormat formatter = DateFormat.jm();
            final onlyTime = formatter.format(dateTime);
            setTime = onlyTime;
            print("dateTime: ${setTime}");
            notifyListeners();
          },
        ),
      ),
    );
  }
}
