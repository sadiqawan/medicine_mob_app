import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:medicine_app/model/massage.dart';

class ChatService extends ChangeNotifier {
  // geting of instance
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  //Send massage
  Future<void> sandMassage(String receiverId, String massage,String receiverName) async {
    // get current user
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    // create a new massage

    Message newMassage = Message(
        sanderId: currentUserId,
        sanderEmail: currentUserEmail,
        receiverId: receiverId,
        massage: massage,
        timestamp: timestamp);

    // construct a chatRoom id form current user id and receiver id

    List<String> ids = [currentUserId, receiverId];
    ids.sort(); // for creating new chat room id
    String chatRoomId = ids.join("_"); // combine them with single _

    // add new massage to the data base

    await _firebaseFirestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMassage.toMap());

    // Update the chat room's last message and timestamp
    await _firebaseFirestore.collection('chat_rooms').doc(chatRoomId).set({
      'lastMessage': massage,
      'timestamp': timestamp,
      'participants': ids,
     "sanderEmail": currentUserEmail,
      "receiverId": receiverId,
      "receiverName" : receiverName

    });


  }



// Get massage

  Stream<QuerySnapshot> getMassages(String userId, String otherUserId) {
    // construct chatRoom id form user  ids (sort them to ensure the id when sending)
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");
    return _firebaseFirestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();


  }

  // get all the list of user who have sand massage

// Get chat list for the current user
  Stream<QuerySnapshot> getChatList() {
    final String currentUserId = _firebaseAuth.currentUser!.uid;

    return _firebaseFirestore
        .collection('chat_rooms')
        .where('participants', arrayContains: currentUserId)
        .orderBy('timestamp', descending: true)
        .snapshots();
  }
}
