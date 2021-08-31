import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:sage/core/constants/colors.dart';
import 'package:sage/core/constants/styles.dart';
import 'package:sage/ui/custom_widgets/custom_grid_tile.dart';
import 'package:sage/ui/screens/profile_screens/profle_screen.dart';
import 'package:sage/ui/screens/setting_screen.dart';

import 'conversation_screens/message_screen.dart';
import 'dashboard_screen.dart';
import 'home_screen_body.dart';
import 'journal_screens/journal_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  // const Home({ Key? key }) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      ///
      /// App bar
      ///
      // appBar: AppBar(
      //   title: Text("Welcome"),
      //   centerTitle: true,
      //   elevation: 0.0,
      //   shape: appBarShape,
      // ),

      ///
      /// Body
      ///
      body: _pageIndex == 0
          ? HomeScreenBody()
          : _pageIndex == 1
          ? DashboardScreen()
          : _pageIndex == 2
          ? JournalScreen()
          : _pageIndex == 3
          ? MessageScreen()
          : HomeScreenBody(),

      ///
      /// Bottom navigation bar
      ///
      bottomNavigationBar: FancyBottomNavigation(
        initialSelection: _pageIndex,
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
          // TabData(iconData: Icons.account_circle, title: "Profile"),
        ],
        onTabChangedListener: (index) {
          if (index == 0) {
            setState(() {
              _pageIndex = 0;
            });
            // Get.offAll(()=>HomeScreen());

          }
          if (index == 1) {
            setState(() {
              _pageIndex = 1;
            });
            // Get.offAll(()=>DashboardScreen());
          }
          if (index == 2) {
            setState(() {
              _pageIndex = 2;
            });
            // Get.offAll(()=>JournalScreen());
          }
          if (index == 3) {
            setState(() {
              _pageIndex = 3;
            });
            // Get.offAll(()=>MessageScreen());
          }
          // if (index == 4) {
          //   setState(() {
          //     _pageIndex = 4;
          //   });
          // }
        },
      ),
    );
  }
}
