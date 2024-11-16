import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CustomerMainController extends GetxController{
  // Stream to get user pharmacies data
  /*Stream<DocumentSnapshot<Map<String, dynamic>>> getPharmaciesDataStream() {
    String uId = FirebaseAuth.instance.currentUser!.uid;
    return FirebaseFirestore.instance.collection('pharmacies').doc(uId).snapshots();
  }*/
  Stream<QuerySnapshot<Map<String, dynamic>>> getPharmaciesDataStream() {
    return FirebaseFirestore.instance.collection('pharmacies').snapshots();
  }



// Stream to get all Medicine data
  Stream<QuerySnapshot<Map<String, dynamic>>> getMedicineDataStream() {
    return FirebaseFirestore.instance.collection('medicines').snapshots();
  }

}