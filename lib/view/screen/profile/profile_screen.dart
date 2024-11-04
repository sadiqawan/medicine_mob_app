import 'package:flutter/material.dart';
import 'package:medicine_app/constant/color_const.dart';
import 'package:medicine_app/view/components/profile_custom_icons.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: kWhite,
        backgroundColor: kPrimaryColor, // Adjust color as needed
        title: const Text('Favorite'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
        
          Container(
            width: double.infinity,
            color: kPrimaryColor, // Background color for the profile section
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.04),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: screenHeight * 0.06,
                      backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Replace with actual image URL
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
                const Text(
                  'Muhammad',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  '+123 567 89000',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const Text(
                  'muhd@example.com',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
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
