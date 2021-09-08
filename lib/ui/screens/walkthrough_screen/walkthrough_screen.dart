import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sage/core/constants/colors.dart';
import 'package:sage/ui/custom_widgets/back_button.dart';
import 'package:sage/ui/custom_widgets/custom_page_route.dart';
import 'package:sage/ui/custom_widgets/next_button.dart';
import 'package:sage/ui/screens/questionnaires_screens/question_screens.dart';
import 'package:sage/ui/screens/walkthrough_screen/walkthroug_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalkThroughScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WalkThroughProvider(),
      child: Scaffold(
        body: SafeArea(
          child: Consumer<WalkThroughProvider>(
            builder: (context, model, child) {
              return Column(
                children: [
                  ///
                  /// Logo
                  ///
                  SizedBox(
                    height: 40.h,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/logo/sage_logo_text.png',
                    ),
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 29.0),
                      child: Text(
                        "Find out how our app works",
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  ///
                  /// Video
                  ///
                  Flexible(
                    child: Image.asset('assets/images/video_image.png'),
                  ),

                  ///
                  /// Next and back button
                  ///
                  SizedBox(
                    height: 18.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///
                        ///Back button
                        ///
                        Container(
                          width: 85.w,
                          child: CustomBackButton(
                            color: primaryColor,
                            title: "Back",
                            icon: Icons.arrow_back_ios,
                            onPressed: () {
                              if (model.index == 0) {
                                model.index = 0;
                              } else {
                                model.index--;
                              }
                              model.getPreviousIndexData(model.index);
                            },
                          ),
                        ),
                        Text(
                          "Playing ${(model.index + 1)}/${model.youtubeData.length}",
                          style: TextStyle(fontSize: 16.sp),
                        ),

                        ///
                        /// Next button
                        ///
                        CustomNextButton(
                          height: 36.h,
                          width: 85.w,
                          title: "Next",
                          icon: Icons.arrow_forward_ios_sharp,
                          onPressed: () {
                            if (model.index == model.youtubeData.length - 1) {
                              Navigator.pushReplacement(context, CustomPageRoute(child: QuestionScreen()));
                              // Get.offAll(() => QuestionScreen());
                              model.index = model.index;
                            } else {
                              model.index++;
                            }
                            model.getNextIndexData(model.index);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  ///
                  /// Description
                  ///
                  Expanded(
                    child: ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 35.0),
                          child: Text(
                            model.youtubeData[model.index],
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
