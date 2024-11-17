import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String sanderId;
  final String sanderEmail;
  final String receiverId;
  final String massage;
  final Timestamp timestamp;

  Message({
    required this.sanderId,
    required this.sanderEmail,
    required this.receiverId,
    required this.massage,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'sanderId': sanderId,
      'sanderEmail': sanderEmail,
      'receiverId': receiverId,
      'timestamp': timestamp,
      'message': massage,
    };
  }
}
