// views/screens/user_chatting_screen.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicine_app/constant/color_const.dart';
import 'package:medicine_app/constant/styles_const.dart';
import 'package:medicine_app/services/chat_service.dart';

class UserChattingScreen extends StatefulWidget {
  final String receiverId;
  final String pharmacyName;

  const UserChattingScreen({
    super.key,
    required this.receiverId,
    required this.pharmacyName,
  });

  @override
  State<UserChattingScreen> createState() => _UserChattingScreenState();
}

class _UserChattingScreenState extends State<UserChattingScreen> {
  // final UserChatController chatController = Get.put(UserChatController());
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sandMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sandMassage(
          widget.receiverId, _messageController.text.trim(),widget.pharmacyName);
      // clear the controller after sending message
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kWhite,
          appBar: AppBar(
            backgroundColor: kWhite,
            // title: Text(widget.pharmacyName, style: mediumPrimaryBoldText),
            centerTitle: true,
            elevation: 1,
          ),
          body: Column(
            children: [
              Expanded(child: _buildMessageList()

                  ),
              _buildingMessageInput()
            ],
          ),
        ),
      ),
    );
  }

  // building a messages list

  Widget _buildMessageList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder(
          stream: _chatService.getMassages(
              widget.receiverId, _firebaseAuth.currentUser!.uid),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error${snapshot.error}');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('Loading...');
            }
            return ListView(
              children: snapshot.data!.docs
                  .map((document) => _buildMessageItem(document))
                  .toList(),
            );
          }),
    );
  }

  //building a message item

  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    var alignment = (data['sanderId'] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Align(
      alignment: alignment,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7, // Set max width
        ),
        decoration: BoxDecoration(
          color: data['sanderId'] == _firebaseAuth.currentUser!.uid
              ? kPinkColor
              : kPrimaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          data['message'],
          style: mediumTextWhiteBold,
        ),
      ),
    );
  }


  // building a message input

  Widget _buildingMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: "Type your message...",
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              ),
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: () => sandMessage(),
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: const BoxDecoration(
                color: kPinkColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.send, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}


