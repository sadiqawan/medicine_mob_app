import 'package:flutter/material.dart';
import 'package:medicine_app/constant/color_const.dart';
import 'package:medicine_app/constant/styles_const.dart';
import 'package:medicine_app/view/components/profile_custom_icons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: kWhite,
        backgroundColor: kPrimaryColor, // Adjust color as needed
        title: Text('Profile',style: largeTextWhiteBold,),
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
      ),
      body: Column(
        children: [
        
          Container(
            width: double.infinity,
            color: kPrimaryColor, 
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.04),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: screenHeight * 0.06,
                      backgroundImage: const AssetImage('assets/images/profile.png'),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: screenHeight * 0.02,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.edit,
                          color: Colors.orange,
                          size: screenHeight * 0.02,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Muhammad',
                  style: mediumTextWhiteBold,
                ),
                 Text(
                  '+123 567 89000',
                  style: smallTextWhiteBold,
                ),
                 Text(
                  'muhd@example.com',
                  style: smallTextWhiteBold,
                ),
              ],
            ),
          ),
          // List of options
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(screenWidth * 0.04),
              children: [
                ProfileCustomIcons(Icons.privacy_tip, 'Privacy Policy', context),
                ProfileCustomIcons(Icons.settings, 'Settings', context),
                ProfileCustomIcons(Icons.help, 'Help', context),
                ProfileCustomIcons(Icons.logout, 'Logout', context),
              ],
            ),
          ),
        ],
      ),
    );
  }

 
}
