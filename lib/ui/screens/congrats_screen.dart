import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sage/core/constants/colors.dart';
import 'package:sage/core/constants/styles.dart';
import 'package:sage/ui/custom_widgets/next_button.dart';
import 'package:sage/ui/screens/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CongratsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///
      /// Appbar
      ///
      appBar: AppBar(
        title: Text('Congrats'),
        centerTitle: true,
        elevation: 0.0,
        shape: appBarShape,
      ),
      ///
      /// body
      ///
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Hey great job!',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21.sp),
            ),
            SizedBox(height: 5,),
            Divider(thickness: 2,color: primaryColor,),
            ///
            /// Congrats image
            ///
            Center(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset('assets/images/congrats_image.png'),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 38.0,vertical: 25),
                      child: Text('Thanks for filling this out.\n You are all set up',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
            ),
            Divider(thickness: 2,color: primaryColor,),
            SizedBox(height: 15.h,),
            Text(
              'Message your coach now to let them know',
              style: TextStyle(fontSize: 16.sp),
            ),
            SizedBox(height: 40.h,),
            ///
            /// Next button
            ///
            CustomNextButton(
              title: "Next",
              icon: Icons.arrow_forward_ios,
              height: 48.h,
              width: 218.w,
              onPressed: ()=>Get.offAll(()=>HomeScreen()),
            ),
          ],
        ),
      ),
    );
  }
}
