import 'package:get/get.dart';
import 'package:job2main/utils/constants/enums.dart';

class UserTypeController extends GetxController {
  var userType = UserType.worker.obs;

  void setUserType(UserType type) {
    userType.value = type;
  }

  UserType getUserType() {
    return userType.value;
  }

  String getUserTypeString() {
    return userTypeMap[userType.value]!;
  }
}
