import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sage/core/constants/colors.dart';
import 'package:sage/core/constants/styles.dart';
import 'package:sage/core/models/conversation.dart';
import 'package:sage/ui/screens/conversation_screens/message_provider.dart';

class ChatScreen extends StatelessWidget {
  final Conversation? conversation;
  ChatScreen({this.conversation});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>MessageProvider(),
      child: Consumer<MessageProvider>(
        builder: (context, model, child){
          return Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              title: ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/profile_image.png"),
                ),
                title: Text(
                  "${conversation!.name}",
                  style: fontSize16.copyWith(fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ),
              shape: appBarShape,
            ),
            ///
            /// body
            ///
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///
                /// Messages
                ///
                Expanded(
                  child: ListView.builder(
                    itemCount: model.messages.length,
                    itemBuilder: (context, index){
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal:15 ,vertical: 10),
                        child: Align(
                          alignment: (model.messages[index].messageType == "receiver"? Alignment.topLeft : Alignment.topRight),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                            decoration: textFiledContainerStyle.copyWith(
                              color:(model.messages[index].messageType  == "receiver"?Colors.white:primaryColor),
                            ),
                            child: Text(
                              "${model.messages[index].messageText}",
                              style: TextStyle(
                                color: model.messages[index].messageType  == "receiver"?Colors.black:Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                ///
                /// send message
                ///
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Message...",
                      suffixIcon: GestureDetector(
                        child: Icon(Icons.send),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide(color: primaryColor)
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      )
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
