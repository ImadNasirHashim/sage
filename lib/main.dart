import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sage/core/constants/colors.dart';
import 'package:sage/ui/screens/home_screen.dart';
import 'package:sage/ui/screens/journal_screen.dart';
import 'package:sage/ui/screens/questionnaires_screens/question_screens.dart';
import 'package:sage/ui/screens/setting_screen.dart';
import 'package:sage/ui/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: primaryColor
      ),
      // home: SplashScreen(),
   home: QuestionScreen(),
    );
  }
}
