import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sage/core/constants/colors.dart';
import 'package:sage/ui/custom_widgets/custom_page_route.dart';
import 'package:sage/ui/custom_widgets/custom_textfield.dart';
import 'package:sage/ui/custom_widgets/password_textfield.dart';
import 'package:sage/ui/custom_widgets/rectangular_button.dart';
import 'package:sage/ui/screens/auth/sign_in/login_provider.dart';
import 'package:sage/ui/screens/auth/sign_up/sign_up_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 43.0, vertical: 20),
              child: Center(
                child: Consumer<LoginProvider>(
                  builder: (context, model, child) {
                    return Form(
                      key: model.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///
                          /// Logo
                          ///
                          Center(
                              child: Image.asset(
                                  'assets/logo/sage_logo_text.png')),
                          SizedBox(
                            height: 40.h,
                          ),

                          Text(
                            "Welcome",
                            style: TextStyle(
                                fontSize: 36.sp, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Continue to sign in!",
                            style: TextStyle(
                                fontSize: 24.sp, fontWeight: FontWeight.normal),
                          ),

                          ///
                          /// email text field
                          ///
                          SizedBox(
                            height: 30.h,
                          ),
                          Text("Email"),
                          SizedBox(
                            height: 5,
                          ),
                          CustomTextField(
                            hintText: "username@gmail.com",
                            textInputAction: TextInputAction.next,
                            keyBoardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              model.appUser.email = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your email';
                              }
                              if(!value.contains("@"))
                                {
                                  return "Enter valid email";
                                }
                            },
                            sufFixIcon: 'assets/icons/sent_icon.png',
                            preFixIcon: Icons.email,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),

                          ///
                          /// password text field
                          ///
                          Text("Password"),
                          SizedBox(
                            height: 5,
                          ),
                          PasswordTextField(
                            hintText: 'Password',
                            textInputAction: TextInputAction.done,
                            keyBoardType: TextInputType.visiblePassword,
                            onChanged: (value) {
                              model.appUser.password = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password can't be empty";
                              }
                              if (value.length < 6) {
                                return "Password length must be 6 characters";
                              }
                            },
                          ),
                          SizedBox(
                            height: 11.h,
                          ),

                          ///
                          /// Radio button and forgot password
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
                                    value: model.isRememberMe,
                                    onChanged: (newValue) {
                                      model.rememberMe(newValue);
                                    },
                                    activeColor: primaryColor,
                                  ),
                                  title: Text(
                                    'Remember me',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                              Text(
                                'Forgot Password?',
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40.h,
                          ),

                          ///
                          /// Sign in button
                          ///
                          RectangularButton(
                              title: 'Sign In',
                              onPressed: () =>
                                  model.checkUserTextField(model.appUser,context)),
                          SizedBox(
                            height: 28.h,
                          ),

                          ///
                          /// Don't have an account?  sign up option
                          ///
                          GestureDetector(
                            onTap: (){
                              Navigator.pushReplacement(context, CustomPageRoute(child: SignUpScreen()));
                            },
                            // onTap: () => Get.offAll(() => SignUpScreen()),
                            child: RichText(
                              text: TextSpan(
                                  text: "Don't have an account?  ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: "Sign Up",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                        ))
                                  ]),
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
