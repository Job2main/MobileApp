import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:job2main/common/models/user.dart';
import 'package:job2main/utils/firebase/auth.dart';

class UserController extends ChangeNotifier {
  final Auth _authService = Auth();

  User? _currentUser;
  Map<String, dynamic>? _userData;
  UserModel? _userModel;

  User? get currentUser => _currentUser;
  Map<String, dynamic>? get userData => _userData;
  UserModel? get userModel => _userModel;

  UserModel? getUserModel() {
    return _userModel;
  }

  Future<void> initialize() async {
    _authService.authStateChanges().listen((user) async {
      if (_currentUser != null) {
        await loadUserData();
      }
      notifyListeners();
    });
  }

  Future<void> login(String email, String password) async {
    _currentUser = await _authService.signInWithEmailAndPassword(email: email, password: password);
    if (_currentUser != null) {
      await loadUserData();
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await _authService.signOut();
    _currentUser = null;
    _userData = null;
    _userModel = null;
    notifyListeners();
  }

  Future<void> loadUserData() async {
    if (_currentUser != null) {
      Map<String, dynamic>? data = await _authService.getUserData(_currentUser!.uid);
      if (data != null) {
        _userData = data;
        _userModel = UserModel.fromFirestore(data, _currentUser!.uid);
        print(_userModel?.getAsMap().toString());
        notifyListeners();
      }
    }
  }

  Future<void> updateUser(Map<String, dynamic> updatedData) async {
    if (_currentUser != null) {
      await _authService.updateUser(_currentUser!.uid, updatedData);
      _userModel?.updateUserProfile(updatedData);
    }
  }
}
