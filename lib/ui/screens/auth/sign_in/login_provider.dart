import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sage/core/models/user.dart';
import 'package:sage/core/view_models/base_view_model.dart';
import 'package:sage/ui/custom_widgets/custom_page_route.dart';
import 'package:sage/ui/screens/walkthrough_screen/walkthrough_screen.dart';

class LoginProvider extends BaseViewModal{

  AppUser appUser=AppUser();

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  bool isRememberMe = false;

  rememberMe(value){
    isRememberMe = value;
    notifyListeners();
  }


  ///
  /// Login user
  ///
  checkUserTextField(AppUser appUser,BuildContext context){
    if(formKey.currentState!.validate()){
      print("App user email: ${appUser.email}");
      print("App user Password: ${appUser.password}");
      Navigator.pushReplacement(context, CustomPageRoute(child: WalkThroughScreen()));
      // Get.offAll(()=>WalkThroughScreen());
      // login
    }
  }

}