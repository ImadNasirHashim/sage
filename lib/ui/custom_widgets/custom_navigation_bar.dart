import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sage/core/constants/colors.dart';
import 'package:sage/ui/screens/dashboard_screen.dart';
import 'package:sage/ui/screens/home_screen.dart';
import 'package:sage/ui/screens/journal_screens/journal_screen.dart';
import 'package:sage/ui/screens/conversation_screens/message_screen.dart';


class CustomNavigationBar extends StatelessWidget {

  final currentIndex;

  CustomNavigationBar({this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return FancyBottomNavigation(
      initialSelection: currentIndex,
      circleColor: Colors.white,
      barBackgroundColor: primaryColor,
      inactiveIconColor: Colors.white,
      activeIconColor: primaryColor,
      textColor: Colors.white,
      tabs: [
        TabData(iconData: Icons.home, title: "Home"),
        TabData(iconData: Icons.dashboard, title: "Dashboard"),
        TabData(iconData: Icons.assignment, title: "Journal"),
        TabData(iconData: Icons.message, title: "Message"),
      ],
      onTabChangedListener: (index) {
        if(index==0)
        {
          Get.offAll(()=>HomeScreen());
        }
        if(index==1)
        {
          Get.offAll(()=>DashboardScreen());
        }
        if(index==2)
        {
          Get.offAll(()=>JournalScreen());
        }
        if(index==3)
        {
          Get.offAll(()=>MessageScreen());
        }
      },
    );
  }
}
