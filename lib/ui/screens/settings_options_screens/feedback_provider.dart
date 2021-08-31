import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sage/core/view_models/base_view_model.dart';
import 'package:sage/ui/custom_widgets/rectangular_button.dart';

class FeedbackProvider extends BaseViewModal{
  int? rating;
  bool star1 = false, star2 = false, star3 = false, star4 = false, star5 = false;
  List<String> feedbackList = [
    'thoughtful',
    'Best app for journal',
    'inspiring',
    'add new features',
    'I will recommned',
    'knowledgeable',
    'helpful for me',
    'never such app before'
  ];

  List<String> selectedFeedback= [];


  selectFeedback(value){
    // selectedFeedback = value;
    print(value);
    notifyListeners();

  }



  ///
  /// Rating app
  ///
  ratingApp(int value) {
    rating = value;
    if (value == 1)
      {
        if(star1==false)
        {
          star1=true;
        }
        else
        {
          star1=false;
          star2=false;
          star3=false;
          star4=false;
          star5=false;
        }
      }
    ///rating = 2
      if(value==2)
      {
        if(star2==false)
        {
          star1=true;
          star2=true;
        }
        else
        {
          star2=false;
          star3=false;
          star4=false;
          star5=false;
        }
      }
      /// rating = 3
    if(value==3)
    {
      if(star3==false)
      {
        star1=true;
        star2=true;
        star3=true;
      }
      else
      {
        star3=false;
        star4=false;
        star5=false;
      }
    }
    if(value==4)
    {
      if(star4==false)
      {
        star1=true;
        star2=true;
        star3=true;
        star4=true;
      }
      else
      {
        star4=false;
        star5=false;
      }
    }
    if(value==5)
    {
      if(star5==false)
      {
        star1=true;
        star2=true;
        star3=true;
        star4=true;
        star5=true;
      }
      else
      {
        star5=false;
      }
    }

    notifyListeners();
    print("our rating value : $rating");
  }

  sendFeedback(BuildContext context){
    Get.defaultDialog(
      barrierDismissible: false,
      title: '',
      content: Container(
        height: 200.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/logo/sage_logo_text.png'),
            SizedBox(height: 10.h,),
            Align(
              alignment: Alignment.center,
              child: Text("Thank You for your valuable feedback "),
            ),
            SizedBox(height: 20.h,),
            RectangularButton(
              title: 'Done',
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ],
        ),
      )
    );
  }


}