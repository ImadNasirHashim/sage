import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sage/core/constants/colors.dart';
import 'package:sage/core/constants/styles.dart';
import 'package:sage/ui/custom_widgets/back_button.dart';
import 'package:sage/ui/custom_widgets/custom_page_route.dart';
import 'package:sage/ui/custom_widgets/next_button.dart';
import 'package:sage/ui/custom_widgets/question_container.dart';
import 'package:sage/ui/screens/journal_screens/journal_provider.dart';
import 'package:sage/ui/screens/journal_screens/journal_screen.dart';
import 'package:sage/ui/screens/questionnaires_screens/question_screen_provider.dart';
import 'package:sage/ui/screens/self_awareness_screens/self_awareness_screen.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => JournalProvider(),
      child: Scaffold(
        ///
        /// App bar
        ///
        appBar: AppBar(
          title: Text('Set up for best experience'),
          centerTitle: true,
          elevation: 0.0,
          shape: appBarShape,
        ),

        ///
        /// body
        ///
        body: Consumer<JournalProvider>(
          builder: (context, model, child) {
            return Padding(
              padding: EdgeInsets.all(23.0.sp),
              child: Flex(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                direction: Axis.vertical,
                children: [
                  ///
                  /// Question 1
                  ///
                  QuestionContainer(
                    questionNo: 1,
                    title: "How many behaviors do you want to measure?",
                    button: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: CustomBackButton(
                            color: model.isBehaviourMode4 ? primaryColor : primaryColor.withOpacity(0.5),
                            title: "4 behavior",
                            onPressed: (){
                              // model.setBehaviourSize(4);
                              model.selectBehaviourMode();
                            },
                            icon: Icons.done,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: CustomBackButton(
                            color: model.isBehaviourMode8 ? primaryColor : primaryColor.withOpacity(0.5),
                            title: "8 behavior",
                            onPressed: (){
                              model.selectBehaviourMode();
                            },
                            icon: Icons.done,
                          ),
                        ),
                      ],
                    ),
                  ),

                  ///
                  /// Question 2
                  ///
                  QuestionContainer(
                    questionNo: 2,
                    title: "When do you want to be reminded to Journal?",
                    button: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 120.w,
                          child: CustomBackButton(
                            color: primaryColor,
                            title: "${model.setTime}",
                            onPressed: () {
                              model.setTimeForReminder(context);
                            },
                            icon: Icons.notifications,
                          ),
                        ),
                      ],
                    ),
                  ),

                  ///
                  /// Question 3
                  ///
                  QuestionContainer(
                    questionNo: 3,
                    title: "Allow your coach to view your journal entries and send you personalized messages.",
                    button: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 120.w,
                          child: CustomBackButton(
                            color: model.isAllow ? primaryColor : primaryColor.withOpacity(0.5),
                            title: "Yes",
                            onPressed: (){
                              model.allowCoachViewYourJournal();
                            },
                            icon: Icons.done,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          width: 120.w,
                          child: CustomBackButton(
                            color: model.isNotAllow ? primaryColor : primaryColor.withOpacity(0.5),
                            title: "No",
                            onPressed: (){
                              model.allowCoachViewYourJournal();
                            },
                            icon: Icons.close,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ///
                  /// Question 4
                  ///
                  QuestionContainer(
                    questionNo: 4,
                    title: "How many days do you want the Journal?",
                    button: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('0',style: fontSize16,),
                              Text('30',style: fontSize16,),
                              Text('60',style: fontSize16,),
                              Text('90',style: fontSize16,),
                            ],
                          ),
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackShape: RectangularSliderTrackShape(),
                            trackHeight: 4.0,
                            thumbColor: Color(0xFFDFE4DD),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 8.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 18.0),
                          ),
                          child: Slider.adaptive(
                            divisions: 3,
                            min: model.minDays,
                            max: model.maxDays,
                            value: model.selectedDays,
                            onChanged: (value) {
                              model.questionSliderValue(value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 26.h,
                  ),

                  ///
                  /// Next button
                  ///
                  Align(
                    alignment: Alignment.center,
                    child: CustomNextButton(
                      height: 48.h,
                      width: 200.w,
                      title: "Next",
                      icon: Icons.navigate_next_sharp,
                      onPressed: ()=>Navigator.pushReplacement(context, CustomPageRoute(child: SelfAwarenessScreen())),
                      // onPressed: () => Get.offAll(() => SelfAwarenessScreen()),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            );
          },
        ),
        // body: ListView.builder(
        //   itemCount: 5,
        //   itemBuilder: (context, index){
        //     return QuestionContainer(
        //       title: 'How many behaviors do you want to measure?',
        //       button: CustomBackButton(
        //         onPressed: null,
        //         title: "4 behaviour",
        //         icon: Icons.done,
        //       ),
        //     );
        //   },
        // ),
      ),
    );
  }
}
