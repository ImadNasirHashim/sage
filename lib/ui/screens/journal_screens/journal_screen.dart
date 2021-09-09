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
        body: SingleChildScrollView(
          child: Consumer<JournalProvider>(
            builder: (context, model, child) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Form(
                  // key: model.formKey,
                  child: Column(
                    // direction: Axis.vertical,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///
                      /// Behaviour
                      ///
                      Text(
                        '${model.index<=model.behaviourSize-1 ? model.index+1:model.behaviourSize} > Behaviour',
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
                          child: TextFormField(
                            // onChanged: (String value){
                            //   // model.behaviours.add(value);
                            // },
                            // validator: (value){
                            //   if(value == null || value.isEmpty){
                            //     return 'Enter Your Behaviour';
                            //   }
                            // },
                            controller: model.behaviourController,
                            maxLines: 7,
                            decoration: textFieldDecoration.copyWith(
                              hintText: 'Enter Your Behaviour',
                              contentPadding: EdgeInsets.symmetric(vertical: 0)
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),

                      ///
                      /// Slider
                      ///
                      Text(
                        "${model.index<=model.behaviourSize-1 ? model.index+1:model.behaviourSize} > Select your score",
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
                                  min: model.minScore,
                                  max: model.maxScore,
                                  divisions: 4,
                                  value: model.score,
                                  onChanged: (value) {
                                    model.selectScoreValue(value);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      ///
                      /// Next button
                      ///
                      Align(
                        alignment: Alignment.center,
                        child: CustomNextButton(
                          title: model.index < model.behaviourSize-1 ? 'Next':'Submit',
                          icon: Icons.arrow_forward_ios,
                          height: 45.h,
                          width: 218.w,
                          onPressed: () {
                              if (model.index == model.behaviourSize) {
                                model.index = model.index;
                              } else {
                                // print("Our behaviours1: ${model.behaviours[model.index]}");
                                print("Controller value: ${model.behaviourController.text}");
                                model.getUserBehavioursFromUser();
                                model.index++;
                              }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        // bottomNavigationBar: CustomNavigationBar(currentIndex: 2,),
      ),
    );
  }
}
