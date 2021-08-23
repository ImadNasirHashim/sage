import 'package:flutter/material.dart';
import 'package:sage/ui/custom_widgets/question_container.dart';

class QuestionScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///
      /// App bar
      ///
      appBar: AppBar(
        title: Text('Set up for best experience'),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(7),
            bottomRight: Radius.circular(7)
          ),
        ),
      ),
      ///
      /// body
      ///
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index){
                return QuestionContainer();
              },
            ),
          )
        ],
      ),
    );
  }
}
