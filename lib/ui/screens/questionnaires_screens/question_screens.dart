import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sage/core/constants/styles.dart';
import 'package:sage/ui/custom_widgets/back_button.dart';
import 'package:sage/ui/custom_widgets/custom_page_route.dart';
import 'package:sage/ui/custom_widgets/next_button.dart';
import 'package:sage/ui/custom_widgets/question_container.dart';
import 'package:sage/ui/screens/questionnaires_screens/question_screen_provider.dart';
import 'package:sage/ui/screens/self_awareness_screens/self_awareness_screen.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuestionScreenProvider(),
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
        body: Consumer<QuestionScreenProvider>(
          builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(23.0),
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
                            title: "4 behavior",
                            onPressed: null,
                            icon: Icons.done,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: CustomBackButton(
                            title: "8 behavior",
                            onPressed: null,
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
                    title:
                        "Allow your coach to view your journal entries and send you personalized messages.",
                    button: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 120.w,
                          child: CustomBackButton(
                            title: "Yes",
                            onPressed: null,
                            icon: Icons.done,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          width: 120.w,
                          child: CustomBackButton(
                            title: "No",
                            onPressed: null,
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
                              Text('0'),
                              Text('30'),
                              Text('60'),
                              Text('90'),
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
                            min: model.sliderMinValue,
                            max: model.sliderMaxvalue,
                            value: model.sliderValue,
                            onChanged: (value) {
                              model.changeSliderValue(value);
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
