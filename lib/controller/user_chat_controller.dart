// controllers/user_chat_controller.dart

import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserChatController extends GetxController {
  // Observing messages in real-time
  final messages = <Map<String, dynamic>>[].obs;







 //  // Load messages between the user and a specific pharmacy
 //  void loadMessages(String pharmacyId) {
 //    final userId = FirebaseAuth.instance.currentUser?.uid;
 //    if (userId == null) {
 //      // Handle case where user is not logged in
 //      return;
 //    }
 //
 //    FirebaseFirestore.instance
 //        .collection('chats')
 //        .doc(getChatId(userId, pharmacyId)) // Combined ID for the chat document
 //        .collection('messages')
 //        .orderBy('timestamp', descending: false) // Load messages in ascending order
 //        .snapshots()
 //        .listen((snapshot) {
 //      messages.value = snapshot.docs.map((doc) => doc.data()).toList();
 //    });
 //  }
 //
 //  // Send a message to Firebase
 //  Future<void> sendMessage({
 //    required String message,
 //    required String pharmacyId,
 //    required String sender,
 //    required String senderName,
 //    required String receiverName,
 //  }) async {
 //    final userId = FirebaseAuth.instance.currentUser?.uid;
 //    if (userId == null) {
 //      // Handle case where user is not logged in
 //      return;
 //    }
 //
 //    final newMessage = {
 //      'sender': sender,
 //      'message': message,
 //      'timestamp': FieldValue.serverTimestamp(),
 //      'receiver': pharmacyId,
 //    };
 //
 //    // Get chat document reference using a combined chat ID
 //    final chatRef = FirebaseFirestore.instance
 //        .collection('chats')
 //        .doc(getChatId(userId, pharmacyId));
 //
 //    // Ensure chat document exists with basic metadata
 //    await chatRef.set({
 //      'userId': userId,
 //      'pharmacyId': pharmacyId,
 //      'userName': senderName,
 //      'pharmacyName': receiverName,
 //    }, SetOptions(merge: true));
 //
 //    // Add the message to the messages subcollection within the chat document
 //    await chatRef.collection('messages').add(newMessage);
 //  }
 //
 //  // Helper method to generate a unique chat ID using user and pharmacy IDs
 //  String getChatId(String userId, String pharmacyId) {
 //    // Sort and concatenate IDs to ensure unique chat ID
 //    return userId.compareTo(pharmacyId) < 0 ? '$userId-$pharmacyId' : '$pharmacyId-$userId';
 //  }
 //
 //
 //  // Get chat list stream for the current user (user or pharmacy)
 //  // Get chat list stream for the current user (user or pharmacy)
 //  Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getUserChatListStream() {
 //    final userId = FirebaseAuth.instance.currentUser?.uid;
 //    if (userId == null) {
 //      // Return an empty stream if the user is not logged in
 //      return Stream.value([]);
 //    }
 //
 //    // Create two streams: one for userId and one for pharmacyId
 //    final userChatsStream = FirebaseFirestore.instance
 //        .collection('chats')
 //        .where('userId', isEqualTo: userId)
 //        .snapshots()
 //        .map((snapshot) => snapshot.docs);
 //
 //    final pharmacyChatsStream = FirebaseFirestore.instance
 //        .collection('chats')
 //        .where('pharmacyId', isEqualTo: userId)
 //        .snapshots()
 //        .map((snapshot) => snapshot.docs);
 //
 //    // Combine both streams using StreamGroup
 //    return StreamGroup.merge([userChatsStream, pharmacyChatsStream]);
 //  }
 //
 // // // Get chat list stream for the current user
 // //  Stream<QuerySnapshot<Map<String, dynamic>>> getUserChatListStream() {
 // //    final userId = FirebaseAuth.instance.currentUser?.uid;
 // //    if (userId == null) {
 // //      // Return an empty stream if user is not logged in
 // //      return Stream.empty();
 // //    }
 // //
 // //    return FirebaseFirestore.instance
 // //        .collection('chats')
 // //        .where('userId', isEqualTo: userId)
 // //        .snapshots();
 // //  }

}















/*
// controllers/user_chat_controller.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserChatController extends GetxController {
  final messages = <Map<String, dynamic>>[].obs;

  // Load messages for a specific pharmacy-user chat
  void loadMessages(String pharmacyId) {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      // Handle case where user is not logged in
      return;
    }

    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('chats')
        .doc(pharmacyId)
        .collection('messages')
        .orderBy('timestamp', descending: false) // Set to ascending to display in order
        .snapshots()
        .listen((snapshot) {
      messages.clear();
      messages.addAll(snapshot.docs.map((doc) => doc.data()));
    });
  }

  // Send message to Firebase
  Future<void> sendMessage({
    required String message,
    required String pharmacyId,
    required String sender,
    required String senderName,
    required String receiverName,
  }) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      // Handle case where user is not logged in
      return;
    }

    final newMessage = {
      'sender': sender,
      'message': message,
      'timestamp': FieldValue.serverTimestamp(),
      'receiver': sender == 'user' ? pharmacyId : userId,
    };

    // References to user's and pharmacy's chat documents
    final userChatRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('chats')
        .doc(pharmacyId);
    final pharmacyChatRef = FirebaseFirestore.instance
        .collection('pharmacies')
        .doc(pharmacyId)
        .collection('chats')
        .doc(userId);

    // Ensure the chat document exists and add message in the `messages` subcollection
    await userChatRef.set({'pharmacyName': receiverName}, SetOptions(merge: true));
    await pharmacyChatRef.set({'userName': senderName}, SetOptions(merge: true));

    await userChatRef.collection('messages').add(newMessage);
    await pharmacyChatRef.collection('messages').add(newMessage);
  }

  // Get chat list stream for the current user
  Stream<QuerySnapshot<Map<String, dynamic>>> getUserChatListStream() {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      // Return an empty stream if user is not logged in
      return Stream.empty();
    }

    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('chats')
        .snapshots();
  }
}
*/
