import 'package:flutter/material.dart';
import 'package:sage/core/constants/colors.dart';
import 'package:sage/core/constants/styles.dart';

class TermsAndPoliciesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      ///
      /// appbar
      ///
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text("Self-Awareness & Journal"),
        centerTitle: true,
        elevation: 0.0,
        shape: appBarShape,
      ),
      ///
      /// Body
      ///
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 7),
        height: MediaQuery.of(context).size.height,
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text('Complete Terms and Policy details',style: fontSize16,),
            ),
            SizedBox(height: 10,),
            Text('Legal terms of use'),
            SizedBox(height: 10,),
            Text('Version 1.0'),
            SizedBox(height: 10,),
            Text('The SAGEApp located at SAGEApp.com is a copyrighted work belonging'
                ' to sage app. Certain features of the Site may be subject to additional'
                ' guidelines, terms, or rules, which will be posted on the Site in'
                ' connection with such features.',
              style: fontSize16,
            ),
            SizedBox(height: 10,),
            Text('All such additional terms, guidelines, and rules are incorporated'
                ' by reference into these Terms.',
              style: fontSize16,
            ),
            SizedBox(height: 10,),
            Text('All such additional terms, guidelines, and rules are incorporated'
                ' by reference into these Terms.',
              style: fontSize16,
            ),
            SizedBox(height: 10,),
            Text('Term and Termination.'),
            SizedBox(height: 10,),
            Text('Subject to this Section, these Terms will remain in full force and effect'
                ' while you use the Site.  We may suspend or terminate your rights to use'
                ' the Site at any time for any reason at our sole discretion, including for'
                ' any use of the Site in violation of these Terms. ',
              style: fontSize16,
            ),
            SizedBox(height: 20,),
            ///
            /// Copy right info
            ///
            Text(
              'Copyright/Trademark Information',
              style: fontSize16.copyWith(fontWeight: FontWeight.bold)
            ),
            SizedBox(height: 10,),
            Text(
              'Copyright ©. All rights reserved.  All trademarks, logos and service marks'
                  ' displayed on the Site are our property or the property of other'
                  ' third-parties. You are not permitted to use these Marks without our'
                  ' prior written consent or the consent of such third party which may own'
                  ' the Marks.',
              style: fontSize16,
            ),
            SizedBox(height: 30,),
            ///
            /// Contact information
            ///
            Text(
              'Contact Information',
              style: fontSize16.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10,),
            Text("Address: info@sageapp.com",style: fontSize16,),
            SizedBox(height: 20,),
            Text("Email: sageuser@sageapp.com",style: fontSize16,),
          ],
        ),
      ),
    );
  }
}
