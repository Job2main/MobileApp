import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:job2main/common/models/user.dart';
import 'package:job2main/utils/constants/enums.dart';
import 'package:job2main/utils/firebase/auth.dart';

class UserController extends GetxController {
  final Auth _authService = Auth();

  User? currentUser = FirebaseAuth.instance.currentUser;
  final Rx<UserModel?> _userModel = Rx<UserModel?>(null);
  UserModel? get userModel => _userModel.value;

  Future<UserModel?> fetchUserModel() async {
    if (_userModel.value == null) {
      await loadUserData(UserType.none);
      return Future.value(_userModel.value);
    }
    return _userModel.value;
  }

  Future<bool> login(UserType type, String email, String password) async {
    currentUser = await _authService.signInWithEmailAndPassword(email: email, password: password);
    if (currentUser != null) {
      await loadUserData(type);
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    await _authService.signOut();
    currentUser = null;
    _userModel.value = null;
    _userModel.refresh();
  }

  Future<void> loadUserData(UserType type) async {
    if (currentUser != null) {
      Map<String, dynamic>? data = await _authService.getUserByUuid(currentUser!.uid, type: type);
      if (data != null) {
        _userModel.value = UserModel.fromFirestore(data, currentUser!.uid);
        _userModel.refresh();
      }
    }
  }

  Future<void> updateUser(Map<String, dynamic> updatedData, {UserType type = UserType.none}) async {
    if (type == UserType.none) {
      type = _userModel.value?.userType ?? UserType.none;
    }
    if (currentUser != null && type != UserType.none) {
      await _authService.updateUser(type, currentUser!.uid, updatedData);
      _userModel.value?.updateUserProfile(updatedData);
      _userModel.refresh();
    } else {
      print('User not logged in');
    }
  }
}
