import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sage/core/constants/colors.dart';
import 'package:sage/core/constants/styles.dart';
import 'package:sage/ui/custom_widgets/custom_navigation_bar.dart';
import 'package:sage/ui/custom_widgets/custom_page_route.dart';
import 'package:sage/ui/screens/conversation_screens/chat_screen.dart';
import 'package:sage/ui/screens/conversation_screens/message_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MessageProvider(),
      child: Scaffold(
        ///
        /// AppBar
        ///
        appBar: AppBar(
          title: Text("Messages"),
          centerTitle: true,
          shape: appBarShape,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(Icons.search),
            ),
          ],
        ),

        ///
        /// Body
        ///
        body: Consumer<MessageProvider>(
          builder: (context, model, child) {
            return ListView.builder(
              itemCount: model.messages.length,
              itemBuilder: (context, index) {
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
              },
            );
          },
        ),
        // bottomNavigationBar: CustomNavigationBar(currentIndex: 3,),
      ),
    );
  }
}
