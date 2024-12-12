import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:job2main/utils/constants/enums.dart';

class UserModel {
  String uid = "";
  String firstName = "";
  String lastName = "";
  String userName = "";
  String email = "";
  String profilePictureUrl = "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250";
  String phoneNumber = "";
  String city = "";
  String country = "";
  int age = 0;
  int totalHoursWorked = 0;
  int totalJobsDone = 0;
  String profileDescription = "";
  int notation = 0;
  UserType userType = UserType.worker;
  DateTime createdAt = DateTime.now();

  UserModel();

  void updateUserProfile(Map<String, dynamic> updates) {
    firstName = updates['firstName'] ?? firstName;
    lastName = updates['lastName'] ?? lastName;
    userName = updates['userName'] ?? userName;
    email = updates['email'] ?? email;
    profilePictureUrl = updates['profilePictureUrl'] ?? profilePictureUrl;
    phoneNumber = updates['phoneNumber'] ?? phoneNumber;
    city = updates['city'] ?? city;
    country = updates['country'] ?? country;
    age = updates['age'] ?? age;
    profileDescription = updates['profileDescription'] ?? profileDescription;
    userType = updates['userType'] ?? userType;
  }

  Map<String, dynamic> getAsMap() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'email': email,
      'profilePictureUrl': profilePictureUrl,
      'phoneNumber': phoneNumber,
      'city': city,
      'country': country,
      'age': age,
      'totalHoursWorked': totalHoursWorked,
      'totalJobsDone': totalJobsDone,
      'profileDescription': profileDescription,
      'notation': notation,
      'createdAt': createdAt,
    };
  }

  factory UserModel.fromFirestore(Map<String, dynamic> data, String uid) {
    UserModel userModel = UserModel();
    userModel.uid = uid;
    userModel.firstName = data['firstName'] ?? userModel.firstName;
    userModel.lastName = data['lastName'] ?? userModel.lastName;
    userModel.userName = data['userName'] ?? userModel.userName;
    userModel.email = data['email'] ?? userModel.email;
    userModel.profilePictureUrl = data['profilePictureUrl'] ?? userModel.profilePictureUrl;
    userModel.phoneNumber = data['phoneNumber'] ?? userModel.phoneNumber;
    userModel.city = data['city'] ?? userModel.city;
    userModel.country = data['country'] ?? userModel.country;
    userModel.age = data['age'] ?? userModel.age;
    userModel.totalHoursWorked = data['totalHoursWorked'] ?? userModel.totalHoursWorked;
    userModel.totalJobsDone = data['totalJobsDone'] ?? userModel.totalJobsDone;
    userModel.profileDescription = data['profileDescription'] ?? userModel.profileDescription;
    userModel.notation = data['notation'] ?? userModel.notation;
    userModel.createdAt = (data['createdAt'] ?? userModel.createdAt as Timestamp).toDate();
    userModel.userType = userTypeMapReverse[data["userType"]] ?? userModel.userType;
    return userModel;
  }

  String getKeyName(dynamic value) {
    Map<String, dynamic> fields = getAsMap();
    String keyName = fields.keys.firstWhere((k) => fields[k] == value, orElse: () => 'Key not found');
    return keyName;
  }
}
