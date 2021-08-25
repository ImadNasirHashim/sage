import 'package:flutter/material.dart';
import 'package:sage/ui/custom_widgets/custom_navigation_bar.dart';

class MessageScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Message screen"),
      ),
      bottomNavigationBar: CustomNavigationBar(currentIndex: 3,),
    );
  }
}
