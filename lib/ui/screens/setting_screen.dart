import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sage/core/constants/colors.dart';

class SettingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      ///
      /// App bar
      ///
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text("SAGE-APP Settings"),
        centerTitle: true,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(7),
            bottomLeft: Radius.circular(7),
          ),
        ),
      ),
      ///
      /// Body
      ///
      body: ListView(
        children: [
          ///
          /// Change Notifications option
          ///
          SettingListTile(
            title: "Change Notifications",
            leadingIcon: Icon(Icons.arrow_forward_ios),
            onPressed: null,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Divider(thickness: 2,color: Colors.green.shade100,),
          ),
          ///
          /// Receive Messages option
          ///
          SettingListTile(
            title: "Receive Messages",
            leadingIcon: CupertinoSwitch(
              value: true,
              onChanged: (value){},
            ),
            onPressed: null,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Divider(thickness: 2,color: Colors.green.shade100,),
          ),
          ///
          /// Change Journal option
          ///
          SettingListTile(
            title: "Change Journal",
            leadingIcon: Icon(Icons.arrow_forward_ios),
            onPressed: null,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Divider(thickness: 2,color: Colors.green.shade100,),
          ),
          ///
          /// Contact support option
          ///
          SettingListTile(
            title: "Contact support",
            leadingIcon: Icon(Icons.arrow_forward_ios),
            onPressed: null,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Divider(thickness: 2,color: Colors.green.shade100,),
          ),
          ///
          /// Review / rate SAGE app
          ///
          SettingListTile(
            title: "Review/Rate SAGE app",
            leadingIcon: Icon(Icons.arrow_forward_ios),
            onPressed: null,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Divider(thickness: 2,color: Colors.green.shade100,),
          ),
          ///
          /// Feedback and suggestions
          ///
          SettingListTile(
            title: "Feedback & suggestions",
            leadingIcon: Icon(Icons.arrow_forward_ios),
            onPressed: null,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Divider(thickness: 2,color: Colors.green.shade100,),
          ),
          ///
          /// Terms of use and policies
          ///
          SettingListTile(
            title: "Terms of use & policies",
            leadingIcon: Icon(Icons.arrow_forward_ios),
            onPressed: null,
          ),
          SizedBox(height: 5,),
        ],
      ),
    );
  }
}

class SettingListTile extends StatelessWidget {
  final title;
  final Widget? leadingIcon;
  final onPressed;

  SettingListTile({this.title,this.leadingIcon,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 19),
      child: Material(
        shadowColor: Colors.grey,
        borderRadius: BorderRadius.circular(7),
        elevation: 3,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          title: Text(title),
          trailing: leadingIcon,
          onTap: onPressed,
        ),
      ),
    );
  }
}

