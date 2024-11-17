import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_app/constant/color_const.dart';
import 'package:medicine_app/constant/styles_const.dart';
import 'package:medicine_app/view/screen/chat/user_chatting_screen.dart';

class NewChatScreen extends StatefulWidget {
  const NewChatScreen({super.key});

  @override
  State<NewChatScreen> createState() => _NewChatScreenState();
}

class _NewChatScreenState extends State<NewChatScreen> {
  // Sample user data
  final List<Map<String, String>> users = [
    {
      "name": "Alice",
      "color": "0xff1D2A4D", // Example color for the avatar
    },
    {
      "name": "Bob",
      "color": "0xffFF5733", // Example color for the avatar
    },
    {
      "name": "Charlie",
      "color": "0xff28A745", // Example color for the avatar
    },
    {
      "name": "David",
      "color": "0xff007BFF", // Example color for the avatar
    },
    {
      "name": "Emma",
      "color": "0xffFFC107", // Example color for the avatar
    },
    // Add more users as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          
          actions: const [Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.search,color: kWhite,),
          )],
          title: Text("New Chat", style: mediumTextWhiteBold),
          foregroundColor: kWhite,
          backgroundColor: kPrimaryColor,
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(int.parse(user["color"]!)),
                child: Text(
                  user["name"]!.substring(0, 1),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(user["name"]!),
              onTap: () {
                // Navigate to UserChatScreen when tapped
                // Get.to(() => const UserChattingScreen());
              },
            );
          },
        ),
      ),
    );
  }
}