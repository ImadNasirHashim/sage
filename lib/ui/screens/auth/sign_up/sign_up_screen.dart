import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sage/core/constants/colors.dart';
import 'package:sage/ui/custom_widgets/custom_textfield.dart';
import 'package:sage/ui/custom_widgets/password_textfield.dart';
import 'package:sage/ui/custom_widgets/rectangular_button.dart';
import 'package:sage/ui/screens/auth/sign_in/Login_screen.dart';
import 'package:sage/ui/screens/auth/sign_up/sign_up_provider.dart';

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
              padding: EdgeInsets.symmetric(horizontal: 43.0),
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
                          SizedBox(height: 40,),
                          Center(child: Image.asset('assets/logo/sage_logo_text.png')),
                          SizedBox(height: 41,),

                          ///
                          /// Full name
                          ///
                          SizedBox(height: 41,),
                          Text("Full Name"),
                          SizedBox(height: 5,),
                          CustomTextField(
                            hintText: "SAGE User",
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

                          SizedBox(height: 20,),
                          ///
                          /// user email address
                          ///
                          Text("Email"),
                          SizedBox(height: 5,),
                          CustomTextField(
                            hintText: "sagemindsetuser@gmail.com",
                            onChanged: (value){
                              model.appUser.email = value;
                            },
                            validator: (value){
                              if(value==null || value.isEmpty)
                              {
                                return "Email can't be empty";
                              }
                            },
                            sufFixIcon: 'assets/icons/sent_icon.png',
                            preFixIcon: Icons.email,
                          ),
                          SizedBox(height: 20,),
                          ///
                          /// password text field
                          ///
                          Text("Password"),
                          SizedBox(height: 5,),
                          PasswordTextField(
                            hintText: 'Password',
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
                          SizedBox(height: 20,),

                          ///
                          /// confirm password text field
                          ///
                          Text("Confirm Password"),
                          SizedBox(height: 5,),
                          PasswordTextField(
                            hintText: "Confirm Password",
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
                          SizedBox(height: 30,),
                          ///
                          /// Radio button
                          ///
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: RadioListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  groupValue: model.groupValue,
                                  onChanged: (newValue){
                                    model.termsAndConditions(newValue);
                                  },
                                  value: 1,
                                  activeColor: primaryColor,
                                  title: Text('By signing up you must agree to our terms and conditions',style: TextStyle(color: Colors.black),),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30,),
                          ///
                          /// Sign in button
                          ///
                          RectangularButton(title: 'Sign Up', onPressed: ()=>model.signUpUser(model.appUser)),
                          SizedBox(height: 28,),
                          ///
                          /// have an account?  sign in option
                          ///
                          GestureDetector(
                            onTap: ()=>Get.offAll(()=>LoginScreen()),
                            child: RichText(
                              text: TextSpan(
                                  text: "Have an account?  ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: "Sign In",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 16,
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
