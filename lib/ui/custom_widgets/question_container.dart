import 'package:flutter/material.dart';
import 'package:sage/ui/custom_widgets/back_button.dart';

class QuestionContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 20,
                width: 20,
                child: Center(
                  child: Text('1'),
                ),
              ),
              Text('How many behaviors do you want to measure?'),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              CustomBackButton(title: '4 behaviour',icon: Icons.done,),
              CustomBackButton(title: '8 behaviour',icon: Icons.done,)
            ],
          )
        ],
      ),
    );
  }
}
