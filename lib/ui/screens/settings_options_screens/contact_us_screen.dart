import 'package:flutter/material.dart';
import 'package:sage/core/constants/colors.dart';
import 'package:sage/core/constants/styles.dart';
import 'package:sage/ui/custom_widgets/custom_textfield.dart';
import 'package:sage/ui/custom_widgets/rectangular_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ContactUsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Contact Us"),
        centerTitle: true,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(7),
            bottomLeft: Radius.circular(7),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///
              /// user name
              ///
              Text("Name",style: TextStyle(fontSize: 16.sp),),
              SizedBox(height: 5,),
              CustomTextField(
                hintText: "Sage user",
                sufFixIcon: null,
                onChanged: (value){},
                validator: (value){},
                preFixIcon: Icons.person,
              ),
              SizedBox(height: 20.h,),
              ///
              /// Email address
              ///
              Text("Email",style: TextStyle(fontSize: 16.sp)),
              SizedBox(height: 5,),
              CustomTextField(
                hintText: "example@gmail.com",
                sufFixIcon: null,
                onChanged: (value){},
                validator: (value){},
                preFixIcon: Icons.email,
              ),
              SizedBox(height: 20.h,),
              ///
              /// company
              ///
              Text("Company (Optional)",style: TextStyle(fontSize: 16.sp)),
              SizedBox(height: 5,),
              CustomTextField(
                hintText: "Company",
                sufFixIcon: null,
                onChanged: (value){},
                validator: (value){},
                preFixIcon: Icons.account_balance,
              ),
              SizedBox(height: 20.h,),
              ///
              /// Subject
              ///
              Text("Subject",style: TextStyle(fontSize: 16.sp)),
              SizedBox(height: 5,),
              CustomTextField(
                hintText: "Journal information",
                sufFixIcon: null,
                onChanged: (value){},
                validator: (value){},
                preFixIcon: Icons.person,
              ),
              SizedBox(height: 20.h,),
              ///
              /// user message
              ///
              Text("Message",style: TextStyle(fontSize: 16.sp)),
              SizedBox(height: 5,),
              Container(
                padding: EdgeInsets.all(8),
                decoration: textFiledContainerStyle.copyWith(color: Colors.white),
                child: TextFormField(
                  onChanged: (value){},
                  validator: (value){},
                  maxLines: 5,
                  decoration: textFieldDecoration.copyWith(
                    contentPadding: EdgeInsets.symmetric(vertical: 0.0),
                  ),
                ),
              ),
              SizedBox(height: 20.h,),
              RectangularButton(title: 'SUBMIT', onPressed: (){}),
            ],
          ),
        ),
      ),
    );
  }
}
