import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_app/constant/color_const.dart';
import 'package:medicine_app/constant/styles_const.dart';
import 'package:medicine_app/view/screen/chat/new_chat_screen.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

          foregroundColor: kWhite,
          backgroundColor: kPrimaryColor,
          title: Text("Chats",style: mediumTextWhiteBold,),
          bottom: TabBar(
            labelStyle: mediumTextWhiteBold,
            labelColor: kPinkColor,
            unselectedLabelColor: kWhite,
            controller: _tabController,
            tabs: const [
              Tab(text: "Chats",),
              Tab(text: "Favorites"),
            ],
          ),
        ),
        body: TabBarView(
          
          controller: _tabController,
          children: [
            _buildChatList(), // Chats List
            _buildFavoriteChats(), // Favorite Chats List
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => const NewChatScreen());
          },
          child: const Icon(Icons.chat),
        ),
      ),
    );
  }

  Widget _buildChatList() {
    // Sample chat data
    final List<Map<String, String>> chats = [
      {
        "name": "Umar Pharmacy",
        "lastMessage": "Hey! How are you?",
        "time": "10:30 AM",
        "color": "0xff1D2A4D", // Example color
      },
      {
        "name": "Dream for Life Pharmacy",
        "lastMessage": "Let's meet tomorrow.",
        "time": "9:15 AM",
        "color": "0xffFF5733", // Example color
      },
      {
        "name": "EveryMedico Pharmacy",
        "lastMessage": "Don't forget the meeting.",
        "time": "8:45 AM",
        "color": "0xff28A745", // Example color
      },
      // Add more chat items as needed
    ];

    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 20,
            backgroundColor: Color(int.parse(chat["color"]!)),
            child: Text(chat["name"]!.substring(0, 1), style: const TextStyle(color: Colors.white)),
          ),
          title: Text(chat["name"]!),
          subtitle: Text(chat["lastMessage"]!),
          trailing: Text(chat["time"]!),
          onTap: () {
            // Navigate to chat detail screen
            // Get.to(() => const ChatDetailScreen(chatId: chatId));
          },
        );
      },
    );
  }

  Widget _buildFavoriteChats() {
    // Sample favorite chat data
    final List<Map<String, String>> favoriteChats = [
      {
        "name": "Dawood",
        "lastMessage": "Let's catch up soon!",
        "time": "Yesterday",
        "color": "0xff007BFF", // Example color
      },
      {
        "name": "Aman Ullah",
        "lastMessage": "I have some updates.",
        "time": "2 days ago",
        "color": "0xffFFC107", // Example color
      },
      // Add more favorite chat items as needed
    ];

    return ListView.builder(
      itemCount: favoriteChats.length,
      itemBuilder: (context, index) {
        final chat = favoriteChats[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 20,
            backgroundColor: Color(int.parse(chat["color"]!)),
            child: Text(chat["name"]!.substring(0, 1), style: const TextStyle(color: Colors.white)),
          ),
          title: Text(chat["name"]!),
          subtitle: Text(chat["lastMessage"]!),
          trailing: Text(chat["time"]!),
          onTap: () {
            
          },
        );
      },
    );
  }
}
