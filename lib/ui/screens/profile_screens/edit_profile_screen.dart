import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sage/core/constants/styles.dart';
import 'package:sage/ui/custom_widgets/custom_page_route.dart';
import 'package:sage/ui/custom_widgets/custom_textfield.dart';
import 'package:sage/ui/custom_widgets/rectangular_button.dart';
import 'package:sage/ui/screens/profile_screens/profile_provider.dart';
import 'package:sage/ui/screens/profile_screens/profle_screen.dart';

class EditProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>ProfileProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Edit profile"),
          centerTitle: true,
          shape: appBarShape,
        ),
        body: SingleChildScrollView(
          child: Consumer<ProfileProvider>(
            builder: (context, model, child){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Column(
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
                                  child: Icon(Icons.camera_alt,color: Colors.blue,size: 30,),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    ///
                    /// username
                    ///
                    CustomTextField(
                      hintText: 'username',
                      preFixIcon: Icons.person,
                    ),
                    SizedBox(height: 20,),
                    CustomTextField(
                      hintText: 'Email',
                      preFixIcon: Icons.email,
                    ),
                    SizedBox(height: 20,),
                    CustomTextField(
                      hintText: 'phone number',
                      preFixIcon: Icons.phone,
                    ),
                    SizedBox(height: 20,),
                    ///
                    /// description
                    ///
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: textFiledContainerStyle.copyWith(color: Colors.white),
                      child: TextFormField(
                        onChanged: (value){},
                        validator: (value){},
                        maxLines: 7,
                        decoration: textFieldDecoration.copyWith(
                          hintText: "Description",
                          contentPadding: EdgeInsets.symmetric(vertical: 0.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    ///
                    /// Update profile
                    ///
                    RectangularButton(
                      title: "Update",
                      onPressed: (){
                        Get.snackbar(
                          "Updated",
                          "Your profile has been updated",
                          snackPosition: SnackPosition.BOTTOM,
                        );
                        // Navigator.pushReplacement(context, CustomPageRoute(child: ProfileScreen()),);
                      },
                    ),
                    SizedBox(height: 20,)
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
