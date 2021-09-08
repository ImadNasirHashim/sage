import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sage/core/constants/colors.dart';
import 'package:sage/core/constants/styles.dart';
import 'package:sage/ui/custom_widgets/custom_navigation_bar.dart';
import 'package:sage/ui/custom_widgets/custom_page_route.dart';
import 'package:sage/ui/custom_widgets/custom_textfield.dart';
import 'package:sage/ui/screens/conversation_screens/chat_screen.dart';
import 'package:sage/ui/screens/conversation_screens/message_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MessageProvider(),
      child: Consumer<MessageProvider>(
        builder: (context, model, child){
          return Scaffold(
            ///
            /// AppBar
            ///
            appBar:AppBar(
              title: model.isSearching==false?
              Text("Messages") :CustomTextField(
                hintText: 'Search here',
                onChanged: (value){
                  model.searchUserByName(value);
                },
              ),
              centerTitle: true,
              shape: appBarShape,
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: IconButton(
                    onPressed: (){
                      model.searchingMode();
                    },
                    icon: model.isSearching==false?Icon(Icons.search):Icon(Icons.close),
                  ),
                ),
              ],
            ),

            ///
            /// Body
            ///
            body: ListView.builder(
              itemCount: model.isSearching==false?model.messages.length:model.searchedUsers.length,
              itemBuilder: (context, index) {
                return model.isSearching==false ? buildMessagesBody(model, index, context):
                buildSearchingMessagesBody(model, index, context);
              },
            ),
            // bottomNavigationBar: CustomNavigationBar(currentIndex: 3,),
          );
        },
      ),
    );
  }

  ///
  /// searched user
  ///
  Column buildSearchingMessagesBody(MessageProvider model, int index, BuildContext context) {
    return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30.r,
                      backgroundImage:
                      AssetImage('assets/images/profile_image.png'),),
                    title: Text("${model.searchedUsers[index].name}"),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${model.messages[index].messageText}",
                          style: TextStyle(
                              fontWeight: model.messages[index].isMessageRead!
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                        Text("${model.messages[index].time}"),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          CustomPageRoute(child: ChatScreen(conversation: model.messages[index],)));
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 23.0),
                    child: Divider(
                      thickness: 1,
                      color: primaryColor,
                    ),
                  )
                ],
              );
  }

  ///
  /// messages body
  ///
  Column buildMessagesBody(MessageProvider model, int index, BuildContext context) {
    return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30.r,
                      backgroundImage:
                      AssetImage('assets/images/profile_image.png'),
                    ),
                    title: Text("${model.messages[index].name}"),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${model.messages[index].messageText}",
                          style: TextStyle(
                              fontWeight: model.messages[index].isMessageRead!
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                        Text("${model.messages[index].time}"),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          CustomPageRoute(child: ChatScreen(conversation: model.messages[index],)));
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 23.0),
                    child: Divider(
                      thickness: 1,
                      color: primaryColor,
                    ),
                  )
                ],
              );
  }



}
