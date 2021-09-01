import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sage/core/constants/colors.dart';
import 'package:sage/ui/custom_widgets/custom_page_route.dart';
import 'package:sage/ui/custom_widgets/custom_textfield.dart';
import 'package:sage/ui/custom_widgets/password_textfield.dart';
import 'package:sage/ui/custom_widgets/rectangular_button.dart';
import 'package:sage/ui/screens/auth/sign_in/Login_screen.dart';
import 'package:sage/ui/screens/auth/sign_up/sign_up_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>SignUpProvider(),
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 20),
              child: Center(
                child: Consumer<SignUpProvider>(
                  builder: (context, model, child){
                    return Form(
                      key: model.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///
                          /// Logo
                          ///
                          SizedBox(height: 20.h,),
                          Center(child: Image.asset('assets/logo/sage_logo_text.png')),
                          SizedBox(height: 20.h,),

                          ///
                          /// Full name
                          ///
                          SizedBox(height: 40.h,),
                          Text("Full Name"),
                          SizedBox(height: 5,),
                          CustomTextField(
                            hintText: "SAGE User",
                            textInputAction: TextInputAction.next,
                            keyBoardType: TextInputType.text,
                            onChanged: (value){
                              model.appUser.userName = value;
                            },
                            validator: (value){
                              if(value==null || value.isEmpty)
                              {
                                return "Name can't be empty";
                              }
                            },
                            sufFixIcon: 'assets/icons/sent_icon.png',
                            preFixIcon: Icons.person,
                          ),

                          SizedBox(height: 20.h,),
                          ///
                          /// user email address
                          ///
                          Text("Email"),
                          SizedBox(height: 5,),
                          CustomTextField(
                            hintText: "sageuser@gmail.com",
                            textInputAction: TextInputAction.next,
                            keyBoardType: TextInputType.emailAddress,
                            onChanged: (value){
                              model.appUser.email = value;
                            },
                            validator: (value){
                              if(value==null || value.isEmpty)
                              {
                                return "Email can't be empty";
                              }
                              if(!value.contains("@")){
                                return "Enter valid email";
                              }
                            },
                            sufFixIcon: 'assets/icons/sent_icon.png',
                            preFixIcon: Icons.email,
                          ),
                          SizedBox(height: 20.h,),
                          ///
                          /// password text field
                          ///
                          Text("Password"),
                          SizedBox(height: 5,),
                          PasswordTextField(
                            hintText: 'Password',
                            textInputAction: TextInputAction.next,
                            keyBoardType: TextInputType.visiblePassword,
                            onChanged: (value){
                              model.appUser.password = value;
                            },
                            validator: (value){
                              if(value==null || value.isEmpty)
                              {
                                return "Password can't be empty";
                              }
                              if(value.length<6)
                              {
                                return "Password length must be 6 characters";
                              }
                            },
                          ),
                          SizedBox(height: 20.h,),

                          ///
                          /// confirm password text field
                          ///
                          Text("Confirm Password"),
                          SizedBox(height: 5,),
                          PasswordTextField(
                            hintText: "Confirm Password",
                            textInputAction: TextInputAction.done,
                            keyBoardType: TextInputType.visiblePassword,
                            onChanged: (value){
                              model.appUser.confirmPassword = value;
                            },
                            validator: (value){
                              if(model.appUser.confirmPassword!=model.appUser.password)
                              {
                                return "Password does not matched";
                              }
                            },
                          ),
                          SizedBox(height: 30.h,),
                          ///
                          /// Radio button
                          ///
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: ListTile(
                                  horizontalTitleGap: 0.0,
                                  contentPadding: EdgeInsets.zero,
                                  leading: Checkbox(
                                    value: model.isAgreeTermsAndConditions,
                                    onChanged:(newValue){
                                      model.termsAndConditions(newValue);
                                    },
                                    activeColor: primaryColor,
                                  ),
                                  title: Text('By signing up you must agree to our terms and conditions',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30.h,),
                          ///
                          /// Sign in button
                          ///
                          RectangularButton(title: 'Sign Up', onPressed: ()=>model.signUpUser(model.appUser,context)),
                          SizedBox(height: 28.h,),
                          ///
                          /// have an account?  sign in option
                          ///
                          GestureDetector(
                            onTap: ()=>Navigator.pushReplacement(context, CustomPageRoute(child: LoginScreen())),
                            // onTap: ()=>Get.offAll(()=>LoginScreen()),
                            child: RichText(
                              text: TextSpan(
                                  text: "Have an account?  ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: "Sign In",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                        )
                                    )
                                  ]
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
