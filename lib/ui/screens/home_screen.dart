import 'package:flutter/material.dart';
import 'package:sage/core/constants/colors.dart';
import 'package:sage/core/constants/styles.dart';
import 'package:sage/ui/custom_widgets/custom_grid_tile.dart';
import 'package:sage/ui/custom_widgets/custom_navigation_bar.dart';
import 'package:sage/ui/screens/conversation_screens/message_screen.dart';
import 'package:sage/ui/screens/dashboard_screen.dart';
import 'package:sage/ui/screens/journal_screens/journal_screen.dart';
import 'package:sage/ui/screens/setting_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      ///
      /// App bar
      ///
      appBar: AppBar(
        title: Text("Welcome"),
        centerTitle: true,
        elevation: 0.0,
        shape: appBarShape,
      ),
      ///
      /// Body
      ///
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 23.0.h, vertical: 0),
        child: Center(
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///
              /// Row 1
              ///
              Row(
                children: [
                  CustomGridTile(
                    title: "Dashboard",
                    icon: 'dashboard_icon.png',
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardScreen()));
                    },
                  ),
                  CustomGridTile(
                    title: "Journal",
                    icon: 'journal_icon.png',
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>JournalScreen()));
                    },
                  ),
                ],
              ),
              Divider(thickness: 2,color: Colors.grey,),
              ///
              /// Row 2
              ///
              Row(
                children: [
                  CustomGridTile(
                    title: "Messages",
                    icon: 'message_icon.png',
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MessageScreen()));
                    },
                  ),
                  CustomGridTile(
                    title: "Settings",
                    icon: 'setting_icon.png',
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingScreen()));
                    },
                  ),
                ],
              ),
              Divider(thickness: 2,color: Colors.grey,),
              ///
              /// Row 3
              ///
              Row(
                children: [
                  CustomGridTile(
                    title: "Tutorial",
                    icon: 'tutorial_icon.png',
                    onPressed: null,
                  ),
                  CustomGridTile(
                    title: "Sage Podcast",
                    icon: 'sage_podcast_icon.png',
                    onPressed: null,
                  ),
                ],
              ),
              Divider(thickness: 2,color: Colors.grey,),
              ///
              /// Row 4
              ///
              Row(
                children: [
                  CustomGridTile(
                    title: "External Link",
                    icon: 'links_icon.png',
                    onPressed: null,
                  ),
                  CustomGridTile(
                    title: "Coaching Call",
                    icon: 'coaching_call_icon.png',
                    onPressed: null,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      ///
      /// Bottom navigation bar
      ///
      bottomNavigationBar: CustomNavigationBar(currentIndex: 0,),
    );
  }
}
