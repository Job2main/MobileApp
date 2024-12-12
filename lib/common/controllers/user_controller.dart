import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:job2main/common/models/user.dart';
import 'package:job2main/utils/constants/enums.dart';
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
        await loadUserData(UserType.none);
      }
      notifyListeners();
    });
  }

  Future<void> login(UserType type, String email, String password) async {
    _currentUser = await _authService.signInWithEmailAndPassword(email: email, password: password);
    if (_currentUser != null) {
      await loadUserData(type);
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

  Future<void> loadUserData(UserType type) async {
    if (_currentUser != null) {
      Map<String, dynamic>? data = await _authService.getUserByUuid(_currentUser!.uid, type: type);
      if (data != null) {
        _userData = data;
        _userModel = UserModel.fromFirestore(data, _currentUser!.uid);
        notifyListeners();
      }
    }
  }

  Future<void> updateUser(Map<String, dynamic> updatedData, {UserType type = UserType.none}) async {
    if (type == UserType.none) {
      type = _userModel?.userType ?? UserType.none;
    }
    if (_currentUser != null && type != UserType.none) {
      await _authService.updateUser(type, _currentUser!.uid, updatedData);
      _userModel?.updateUserProfile(updatedData);
      notifyListeners();
    } else {
      print('User not logged in');
    }
  }
}
