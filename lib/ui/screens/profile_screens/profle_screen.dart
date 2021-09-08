import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sage/core/constants/styles.dart';
import 'package:sage/ui/custom_widgets/custom_page_route.dart';
import 'package:sage/ui/custom_widgets/rectangular_button.dart';
import 'package:sage/ui/screens/profile_screens/edit_profile_screen.dart';
import 'package:sage/ui/screens/profile_screens/profile_provider.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>ProfileProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          centerTitle: true,
          shape: appBarShape,
        ),
        body: Consumer<ProfileProvider>(
          builder: (context, model, child){
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      ///
                      /// profile image
                      ///
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 150,
                          width: 150,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                radius: 80,
                                backgroundImage: AssetImage('assets/images/profile_image.png'),
                                backgroundColor: Colors.transparent,
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 15.0),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: GestureDetector(
                                    onTap: (){
                                      model.pickImageFromGallery();
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Icon(Icons.camera_alt,color: Colors.black,size: 30,),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      ///
                      /// Profile body
                      ///
                      SizedBox(height: 20,),
                      ///
                      /// username
                      ///
                      Row(
                        children: [
                          Icon(Icons.person),
                          SizedBox(width: 20,),
                          Expanded(child: Text('username')),
                        ],
                      ),
                      SizedBox(height: 10,),
                      ///
                      /// Email adddress
                      ///
                      Row(
                        children: [
                          Icon(Icons.email),
                          SizedBox(width: 20,),
                          Expanded(child: Text('username@gmail.com')),
                        ],
                      ),
                      SizedBox(height: 10,),
                      ///
                      /// phone number
                      ///
                      Row(
                        children: [
                          Icon(Icons.phone),
                          SizedBox(width: 20,),
                          Expanded(child: Text('+9123456789')),
                        ],
                      ),
                      SizedBox(height: 10,),
                      ///
                      /// description
                      ///
                      Row(
                        children: [
                          Icon(Icons.description),
                          SizedBox(width: 20,),
                          Expanded(child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ")),
                        ],
                      ),
                      SizedBox(height: 20,)
                    ],
                  ),
                  RectangularButton(title: "Edit profile", onPressed: ()=>Navigator.push(context, CustomPageRoute(child: EditProfileScreen()))),

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
