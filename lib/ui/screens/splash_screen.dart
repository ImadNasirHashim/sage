import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sage/ui/screens/auth/sign_in/Login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  splashScreenDelay()async{
    await Future.delayed(Duration(seconds: 3),()=>Get.offAll(()=>LoginScreen()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreenDelay();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 10,
              ),
              Image.asset("assets/logo/Sage_logo.png"),
              Image.asset("assets/logo/text_logo.png"),
            ],
          ),
        ),
      ),
    );
  }
}
