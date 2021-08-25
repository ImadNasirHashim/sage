import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sage/ui/custom_widgets/custom_textfield.dart';
import 'package:sage/ui/custom_widgets/next_button.dart';
import 'package:sage/ui/screens/congrats_screen.dart';
import 'package:sage/ui/screens/self_awareness_screens/self_awareness_provider.dart';

class SelfAwarenessScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>SelfAwarenessProvider(),
      child: Scaffold(
        ///
        /// Appbar
        ///
        appBar: AppBar(
          title: Text('Self-Awareness'),
          centerTitle: true,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(7),
                bottomRight: Radius.circular(7)
            ),
          ),
        ),
        ///
        /// Body
        ///
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 38.0, vertical: 30),
            child: Consumer<SelfAwarenessProvider>(
              builder: (context, model, child){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Select up to  2 behaviours to score and journal about',
                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 33,),
                    ///
                    /// Dropdown
                    ///
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Journal",
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Material(
                      elevation: 5,
                      shadowColor: Colors.grey,
                      borderRadius: BorderRadius.circular(7),
                      child: DropdownButton(
                        itemHeight: 60,
                        isExpanded: true,
                        value: model.dropdownValue,
                        icon: Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Icon(Icons.keyboard_arrow_down),
                        ),
                        underline: SizedBox(),
                        items: model.items.map((String value) {
                          return DropdownMenuItem(
                              value: value,
                              child: Padding(
                                padding:  EdgeInsets.only(left: 45.0),
                                child: Text(value),
                              )
                          );
                        }
                        ).toList(),
                        onChanged: (newValue){
                          model.selectDropDownValue(newValue);
                        },
                      ),
                    ),
                    SizedBox(height: 33,),
                    ///
                    /// Enter behaviour
                    ///
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Enter your own behaviour',
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 5,),
                    CustomTextField(
                      hintText: 'behaviour',
                      onChanged: (value){},
                      validator: (value){},
                      sufFixIcon: "assets/icons/edit.png",
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.3,),
                    ///
                    /// Next button
                    ///
                    CustomNextButton(
                      title: "Next",
                      icon: Icons.arrow_forward_ios,
                      height: 48,
                      onPressed: ()=>Get.offAll(()=>CongratsScreen()),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
