import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sage/core/models/behaviour.dart';
import 'package:sage/core/view_models/base_view_model.dart';
import 'package:sage/ui/custom_widgets/custom_page_route.dart';
import 'package:sage/ui/screens/journal_screens/journal_screen.dart';

class JournalProvider extends BaseViewModal {

  // Behaviour behaviour = Behaviour();
  double score = 1;
  double minScore = 1;
  double maxScore = 5;
  int index = 0;
  bool isBehaviourMode4 = true;
  bool isBehaviourMode8 = false;
  bool isAllow = true;
  bool isNotAllow = false;

  final behaviourController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<String> behaviours=[];
  int behaviourSize = 4;

  JournalProvider(){
    setTime = "9:00 AM";
  }

  ///
  /// Select behaviour
  ///
  selectBehaviourMode(){
    if(isBehaviourMode4){
      isBehaviourMode8 = true;
      isBehaviourMode4 = false;
    }
    else{
      isBehaviourMode8 = false;
      isBehaviourMode4 = true;
    }
    notifyListeners();
  }

  ///
  /// allow coach to view your journal
  ///
  allowCoachViewYourJournal(){
    if(isAllow){
      isAllow = false;
      isNotAllow = true;
    }
    else{
      isAllow = true;
      isNotAllow = false;
    }
    notifyListeners();
  }

  selectScoreValue(double value) {
    score = value;
    print(score);
    notifyListeners();
  }

  getUserBehavioursFromUser() {
    // index = nextIndex;
    // print(behaviours[index]);
    behaviours.add(behaviourController.text);
    print('user behaviour list: $behaviours');
    print('index value: $index');
    behaviourController.clear();
    notifyListeners();
    if(index == behaviourSize-1)
      {
        Get.snackbar("Behaviour", "Your behaviours submitted",snackPosition: SnackPosition.BOTTOM);
      }
  }

  // setBehaviourSize(int value){
  //   behaviourSize = value;
  //   print(behaviourSize);
  //
  //   notifyListeners();
  // }

  ///
  /// Questionnaires screen variables and functions
  ///
  double selectedDays = 0;
  double minDays = 0;
  double maxDays = 90;
  String? setTime;

  questionSliderValue(double value) {
    selectedDays = value;
    print(selectedDays);
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
