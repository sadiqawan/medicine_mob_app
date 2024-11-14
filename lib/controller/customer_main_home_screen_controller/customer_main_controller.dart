import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CustomerMainController extends GetxController{
  // Stream to get user data
  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserDataStream() {
    String uId = FirebaseAuth.instance.currentUser!.uid;
    return FirebaseFirestore.instance.collection('users').doc(uId).snapshots();
  }

}