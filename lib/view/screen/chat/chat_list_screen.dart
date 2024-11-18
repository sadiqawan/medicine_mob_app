// views/screens/chat_list_screen.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_app/constant/color_const.dart';
import 'package:medicine_app/constant/styles_const.dart';
import 'package:medicine_app/services/chat_service.dart';
import 'package:medicine_app/view/screen/chat/user_chatting_screen.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  final ChatService chatService = ChatService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: kWhite,
          backgroundColor: kPrimaryColor,
          title: Text("Chats List", style: mediumTextWhiteBold),
          centerTitle: true,
        ),
        body: StreamBuilder(
          stream: chatService.getChatList(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.orange),
              );
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(
                child: Text(
                  "Chat list is empty.",
                  style: mediumTextWhiteBold.copyWith(color: Colors.black),
                ),
              );
            } else {
              var userChatList = snapshot.data!.docs;

              return ListView.builder(
                itemCount: userChatList.length,
                itemBuilder: (context, index) {
                  final chat = userChatList[index];
                  final chatData = chat.data() as Map<String, dynamic>;
                  // final pharmacyName = chatData['name'] ?? 'Pharmacy';
                  final pharmacyName =
                      chatData['receiverName']??"user";
                  final lastMessage =
                      chatData['lastMessage'] ?? 'No messages yet';

                  return ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.orange,
                      child:
                          const Icon(Icons.person_outline, color: Colors.white),
                    ),
                    title: Text(pharmacyName, style: mediumPrimaryBoldText),
                    subtitle: Text(lastMessage),
                    onTap: () {
                      Get.to(() => UserChattingScreen(
                            pharmacyName: chatData['receiverName'],
                            receiverId: chatData['receiverId'],
                          ));
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
