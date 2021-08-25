import 'package:flutter/material.dart';
import 'package:sage/ui/custom_widgets/custom_navigation_bar.dart';

class DashboardScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Dashboard screen"),
      ),
      bottomNavigationBar: CustomNavigationBar(currentIndex: 1,),
    );
  }
}
