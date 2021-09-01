import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sage/core/models/user.dart';
import 'package:sage/core/view_models/base_view_model.dart';
import 'package:sage/ui/custom_widgets/custom_page_route.dart';
import 'package:sage/ui/screens/walkthrough_screen/walkthrough_screen.dart';

class SignUpProvider extends BaseViewModal{

  AppUser appUser = AppUser();
  final formKey = GlobalKey<FormState>();
  bool isAgreeTermsAndConditions = false;

  termsAndConditions(value)
  {
    isAgreeTermsAndConditions = value;
    notifyListeners();
  }

  signUpUser(AppUser appUser, BuildContext context)
  {
    if(formKey.currentState!.validate())
      {
        // sign up user
        print("User data: ${appUser.userName}");
        print("User data: ${appUser.email}");
        print("User data: ${appUser.password}");
        print("User data: ${appUser.confirmPassword}");
        Navigator.pushReplacement(context, CustomPageRoute(child: WalkThroughScreen()));
        // Get.offAll(()=>WalkThroughScreen());
      }
  }
}