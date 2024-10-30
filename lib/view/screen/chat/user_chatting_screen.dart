import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_app/constant/color_const.dart';
import 'package:medicine_app/constant/styles_const.dart';
import 'package:medicine_app/constant/user_chat_controller.dart';

class UserChattingScreen extends StatefulWidget {
  const UserChattingScreen({super.key});

  @override
  State<UserChattingScreen> createState() => _UserChattingScreenState();
}
final UserChatController chatController = Get.put(UserChatController());
  final TextEditingController messageController = TextEditingController();
class _UserChattingScreenState extends State<UserChattingScreen> {
  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(
        backgroundColor: kWhite,
        appBar: AppBar(
          backgroundColor: kWhite,
          title: Text("Dream for Life", style: mediumPrimaryBoldText),
          centerTitle: true,
          elevation: 1,
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(() => ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    reverse: true,
                    itemCount: chatController.messages.length,
                    itemBuilder: (context, index) {
                      final message = chatController.messages[chatController.messages.length - 1 - index];
                      final isUserMessage = message['sender'] == 'user';

                      return Align(
                        alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.all(12.0),
                          margin: const EdgeInsets.symmetric(vertical: 4.0),
                          decoration: BoxDecoration(
                            color: isUserMessage ? kPinkColor : kPrimaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            message['message'] ?? '',
                            style: mediumTextWhiteBold,
                          ),
                        ),
                      );
                    },
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
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
                    onTap: () {
                      chatController.sendMessage(messageController.text);
                      messageController.clear();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: kPinkColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.send, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}