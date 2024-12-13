import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreJobs {
  final String collectionName = 'JobOffers';
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createJob(String uid, Map<String, dynamic> data) async {
    await _firestore.collection(collectionName).doc(uid).set(data);
  }

  Future<void> updateJob(String uid, Map<String, dynamic> data) async {
    await _firestore.collection(collectionName).doc(uid).update(data);
  }

  Future<void> deleteJob(String uid) async {
    await _firestore.collection(collectionName).doc(uid).delete();
  }

  Future<Map<String, dynamic>?> getJob(String uid) async {
    DocumentSnapshot doc = await _firestore.collection(collectionName).doc(uid).get();
    return doc.exists ? doc.data() as Map<String, dynamic> : null;
  }

  Stream<QuerySnapshot> getJobs() {
    return _firestore.collection(collectionName).snapshots();
  }
}