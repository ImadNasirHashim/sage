import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sage/core/constants/colors.dart';
import 'package:sage/ui/custom_widgets/custom_textfield.dart';
import 'package:sage/ui/custom_widgets/password_textfield.dart';
import 'package:sage/ui/custom_widgets/rectangular_button.dart';
import 'package:sage/ui/screens/auth/sign_in/login_provider.dart';
import 'package:sage/ui/screens/auth/sign_up/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>LoginProvider(),
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 43.0),
              child: Center(
                child: Consumer<LoginProvider>(
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

                          Text("Welcome",style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold),),
                          Text("Continue to sign in!",style: TextStyle(fontSize: 24,fontWeight: FontWeight.normal),),
                          ///
                          /// email text field
                          ///
                          SizedBox(height: 41,),
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
                                  return 'Enter your email';
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
                          SizedBox(height: 11,),
                          ///
                          /// Radio button and forgot password
                          ///
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: RadioListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  groupValue: model.groupValue,
                                  onChanged:(newValue){
                                    model.rememberMe(newValue);
                                  },
                                  value: 1,
                                  activeColor: primaryColor,
                                  title: Text('Remember me',style: TextStyle(color: Colors.black),),
                                ),
                              ),
                              Text('Forgot Password?',style: TextStyle(fontSize: 16),),
                            ],
                          ),
                          SizedBox(height: 50,),
                          ///
                          /// Sign in button
                          ///
                          RectangularButton(title: 'Sign In', onPressed: ()=>model.checkUserTextField(model.appUser)),
                          SizedBox(height: 28,),
                          ///
                          /// Don't have an account?  sign up option
                          ///
                          GestureDetector(
                            onTap: ()=>Get.offAll(()=>SignUpScreen()),
                            child: RichText(
                              text: TextSpan(
                                  text: "Don't have an account?  ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: "Sign Up",
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
