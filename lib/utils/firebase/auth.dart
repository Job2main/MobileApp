import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:job2main/utils/constants/enums.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<User?> signInWithEmailAndPassword({required email, required password}) async {
    UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    if (userCredential.user != null) {
      return userCredential.user;
    }
    return null;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<User?> createUserWithEmailAndPassword({required email, required password}) async {
    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }

  Future<Map<String, dynamic>?> getUserData(UserType type, String uid) async {
    String collection = userTypeMap[type]!;
    DocumentSnapshot doc = await _firestore.collection(collection).doc(uid).get();
    return doc.exists ? doc.data() as Map<String, dynamic> : null;
  }

  Future<void> deleteUser(UserType type, String uid) async {
    String collection = userTypeMap[type]!;
    await _firestore.collection(collection).doc(uid).delete();
  }

  Future<Map<String, dynamic>?> getUserByUuid(String uuid, {UserType type = UserType.none}) async {
    if (type == UserType.none) {
      for (UserType userType in UserType.values) {
        if (userType == UserType.none) continue;
        Map<String, dynamic>? user = await getUserData(userType, uuid);
        if (user != null) {
          return user;
        }
      }
    } else {
      return getUserData(type, uuid);
    }
    return null;
  }
  
  Future<void> updateUser(UserType type, String uid, Map<String, dynamic> data) async {
    String collection = userTypeMap[type]!;
    await _firestore.collection(collection).doc(uid).update(data);
  }

  Future<void> createUser(UserType type, String uid, Map<String, dynamic> data) async {
    String collection = userTypeMap[type]!;
    await _firestore.collection(collection).doc(uid).set(data);
  }
  
}