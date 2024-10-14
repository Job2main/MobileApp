import 'package:get/get.dart';

enum UserType { worker, employer }

class UserTypeController extends GetxController {
  var userType = UserType.worker.obs;

  void setUserType(UserType type) {
    userType.value = type;
  }
}
