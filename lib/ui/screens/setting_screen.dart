import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sage/core/constants/colors.dart';
import 'package:sage/core/constants/styles.dart';
import 'package:sage/ui/custom_widgets/custom_page_route.dart';
import 'package:sage/ui/screens/self_awareness_screens/self_awareness_screen.dart';
import 'package:sage/ui/screens/setting_provider.dart';
import 'package:sage/ui/screens/settings_options_screens/contact_us_screen.dart';
import 'package:sage/ui/screens/settings_options_screens/feedback_screen.dart';
import 'package:sage/ui/screens/settings_options_screens/terms_and_policies.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SettingProvider(),
      child: Scaffold(
        backgroundColor: backgroundColor,

        ///
        /// App bar
        ///
        appBar: AppBar(
          title: Text("SAGE-APP Settings"),
          centerTitle: true,
          elevation: 0.0,
          shape: appBarShape,
        ),

        ///
        /// Body
        ///
        body: Consumer<SettingProvider>(
          builder: (context, model, child) {
            return ListView(
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
                  child: Divider(
                    thickness: 2,
                    color: Colors.green.shade100,
                  ),
                ),

                ///
                /// Receive Messages option
                ///
                SettingListTile(
                  title: "Receive Messages",
                  leadingIcon: CupertinoSwitch(
                    value: model.isMessageReceived,
                    onChanged: (value) {
                      model.messageReceived(value);
                    },
                  ),
                  onPressed: null,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Divider(
                    thickness: 2,
                    color: Colors.green.shade100,
                  ),
                ),

                ///
                /// Change Journal option
                ///
                SettingListTile(
                  title: "Change Journal",
                  leadingIcon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                        context,
                        CustomPageRoute(child: SelfAwarenessScreen()));
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Divider(
                    thickness: 2,
                    color: Colors.green.shade100,
                  ),
                ),

                ///
                /// Contact support option
                ///
                SettingListTile(
                    title: "Contact support",
                    leadingIcon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      Navigator.push(
                          context,
                          CustomPageRoute(child: ContactUsScreen()));
                    }),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Divider(
                    thickness: 2,
                    color: Colors.green.shade100,
                  ),
                ),

                ///
                /// Review / rate SAGE app
                ///
                SettingListTile(
                  title: "Review/Rate SAGE app",
                  leadingIcon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {},
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Divider(
                    thickness: 2,
                    color: Colors.green.shade100,
                  ),
                ),

                ///
                /// Feedback and suggestions
                ///
                SettingListTile(
                  title: "Feedback & suggestions",
                  leadingIcon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                        context,
                        CustomPageRoute(child: FeedBackScreen()));
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Divider(
                    thickness: 2,
                    color: Colors.green.shade100,
                  ),
                ),

                ///
                /// Terms of use and policies
                ///
                SettingListTile(
                  title: "Terms of use & policies",
                  leadingIcon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                        context,
                        CustomPageRoute(child: TermsAndPoliciesScreen()));
                  },
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class SettingListTile extends StatelessWidget {
  final title;
  final Widget? leadingIcon;
  final onPressed;

  SettingListTile({this.title, this.leadingIcon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
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
