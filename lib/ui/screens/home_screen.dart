import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text("Welcome"),
        centerTitle: true,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(7),
            bottomLeft: Radius.circular(7),
          )
        ),
      ),
    );
  }
}
