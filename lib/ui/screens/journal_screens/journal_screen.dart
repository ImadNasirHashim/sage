import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sage/core/constants/colors.dart';
import 'package:sage/core/constants/styles.dart';
import 'package:sage/ui/custom_widgets/custom_navigation_bar.dart';
import 'package:sage/ui/custom_widgets/next_button.dart';
import 'package:sage/ui/screens/journal_screens/journal_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JournalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => JournalProvider(),
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: Text("Self-Awareness & Journal"),
          centerTitle: true,
          elevation: 0.0,
          shape: appBarShape,
        ),
        body: Consumer<JournalProvider>(
          builder: (context, model, child) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///
                  /// Behaviour
                  ///
                  Text(
                    '1 > Behaviour',
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Card(
                    shadowColor: Colors.grey,
                    elevation: 3,
                    // borderRadius: BorderRadius.circular(7),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(model.behaviours[model.index],style: fontSize16,),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  ///
                  /// Slider
                  ///
                  Text(
                    "2 > Select your score",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Card(
                    // borderRadius: BorderRadius.circular(7),
                    shadowColor: Colors.grey,
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('1'),
                                Text('2'),
                                Text('3'),
                                Text('4'),
                                Text('5'),
                              ],
                            ),
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackShape: RectangularSliderTrackShape(),
                              trackHeight: 4.0,
                              thumbColor: Color(0xFFDFE4DD),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 8.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 18.0),
                            ),
                            child: Slider(
                              min: model.sliderMinValue,
                              max: model.sliderMaxvalue,
                              divisions: 4,
                              value: model.sliderValue,
                              onChanged: (value) {
                                model.changeSliderValue(value);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),

                  ///
                  /// Next button
                  ///
                  Align(
                    alignment: Alignment.center,
                    child: CustomNextButton(
                      title: 'Next',
                      icon: Icons.arrow_forward_ios,
                      height: 45.h,
                      width: 218.w,
                      onPressed: () {
                        if (model.index == model.behaviours.length - 1) {
                          model.index = model.index;
                        } else {
                          model.index++;
                        }
                        model.getNextIndexData(model.index);
                      },
                    ),
                  )
                ],
              ),
            );
          },
        ),
        // bottomNavigationBar: CustomNavigationBar(currentIndex: 2,),
      ),
    );
  }
}
