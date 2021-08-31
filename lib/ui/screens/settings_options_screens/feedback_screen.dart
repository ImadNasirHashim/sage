import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sage/core/constants/colors.dart';
import 'package:sage/core/constants/styles.dart';
import 'package:sage/ui/custom_widgets/next_button.dart';
import 'package:sage/ui/screens/setting_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sage/ui/screens/settings_options_screens/feedback_provider.dart';

class FeedBackScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>FeedbackProvider(),
      child: Scaffold(
        ///
        /// Appbar
        ///
        appBar: AppBar(
          title: Text("Feedback & Suggestions"),
          centerTitle: true,
          elevation: 0.0,
          shape: appBarShape,
        ),
        ///
        /// Body
        ///
        body: SingleChildScrollView(
          child: Consumer<FeedbackProvider>(
            builder: (context, model, child){
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rate Your Experience',style: fontSize16.copyWith(fontWeight: FontWeight.bold),),
                    Text('How much you are satisfied with our service?',style: fontSize16,),
                    SizedBox(height: 10.h,),
                    ///
                    /// Rating
                    ///
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ///
                        /// first Star
                        ///
                        GestureDetector(
                          onTap: ()=>model.ratingApp(1),
                          child: model.star1?FilledStar():EmptyStar(),
                        ),
                        ///
                        /// second Star
                        ///
                        GestureDetector(
                          onTap: ()=>model.ratingApp(2),
                          child: model.star2?FilledStar():EmptyStar(),
                        ),
                        ///
                        /// 3rd Star
                        ///
                        GestureDetector(
                          onTap: ()=>model.ratingApp(3),
                          child: model.star3?FilledStar():EmptyStar(),
                        ),
                        ///
                        /// 4th Star
                        ///
                        GestureDetector(
                          onTap: ()=>model.ratingApp(4),
                          child: model.star4?FilledStar():EmptyStar(),
                        ),
                        ///
                        /// 5th Star
                        ///
                        GestureDetector(
                          onTap: ()=>model.ratingApp(5),
                          child: model.star5?FilledStar():EmptyStar(),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    ///
                    /// Feedback about app
                    ///
                    Divider(
                      thickness: 2,
                      color: primaryColor,
                    ),
                    Text("Feedback about App",style: fontSize16.copyWith(fontWeight: FontWeight.bold),),
                    ///
                    /// Choices
                    ///
                    Wrap(
                      spacing: 10,
                      children: List.generate(model.feedbackList.length, (index) => ChoiceChip(
                        label: Text(
                          model.feedbackList[index],
                          style: fontSize16.copyWith(color: Colors.white),
                        ),
                        selected: model.selectedFeedback.contains(model.feedbackList[index]),
                        selectedColor: Colors.white,
                        backgroundColor: primaryColor,
                        onSelected: (value){
                          print(value);
                          model.selectFeedback(value);
                        },
                      ),
                      ),
                    ),
                    ///
                    /// Leave a message
                    ///
                    SizedBox(height: 15.h,),
                    Text("Leave message",style: fontSize16.copyWith(fontWeight: FontWeight.bold),),
                    SizedBox(height: 10.h,),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: textFiledContainerStyle.copyWith(color: Colors.white),
                      child: TextFormField(
                        onChanged: (value){},
                        validator: (value){},
                        maxLines: 10,
                        decoration: textFieldDecoration.copyWith(
                          contentPadding: EdgeInsets.symmetric(vertical: 0.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.h,),
                    ///
                    /// Send button
                    ///
                    Align(
                      alignment: Alignment.center,
                      child: CustomNextButton(
                        title: "SEND FEEDBACK",
                        icon: Icons.send,
                        height: 50.h,
                        width: 218.w,
                        onPressed: ()=>model.sendFeedback(context),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

///
/// Stars
///
class EmptyStar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.star_border,color: primaryColor,size: 30,);
  }
}
class FilledStar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.star,color: primaryColor,size: 30,);
  }
}