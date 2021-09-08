import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sage/core/constants/colors.dart';
import 'package:sage/ui/screens/conversation_screens/message_screen.dart';
import 'package:sage/ui/screens/dashboard_screen.dart';
import 'package:sage/ui/screens/journal_screens/journal_screen.dart';
import 'package:sage/ui/screens/profile_screens/profle_screen.dart';
import 'package:sage/ui/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 736),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          primaryColor: primaryColor,
          scaffoldBackgroundColor: backgroundColor
        ),
        home: SplashScreen(),
        //   home: MessageScreen(),
      ),
    );
  }
}
