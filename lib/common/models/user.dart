class UserModel {
  final String uid;
  String name;
  String familyName;
  String email;
  String profilePictureUrl;
  String phoneNumber;
  String city;
  String country;
  int age;
  final int totalHoursWorked;
  final int totalJobsDone;
  String profileDescription;
  final int notation;
  DateTime memberSince = DateTime.now();

  UserModel({
    required this.uid,
    required this.name,
    required this.familyName,
    required this.email,
    required this.profilePictureUrl,
    required this.phoneNumber,
    required this.city,
    required this.country,
    required this.age,
    required this.totalHoursWorked,
    required this.totalJobsDone,
    required this.profileDescription,
    required this.notation,
  });

  void updateUserProfile(Map<String, dynamic> updates) {
    name = updates['name'] ?? name;
    familyName = updates['familyName'] ?? familyName;
    email = updates['email'] ?? email;
    profilePictureUrl = updates['profilePictureUrl'] ?? profilePictureUrl;
    phoneNumber = updates['phoneNumber'] ?? phoneNumber;
    city = updates['city'] ?? city;
    country = updates['country'] ?? country;
    age = updates['age'] ?? age;
    profileDescription = updates['profileDescription'] ?? profileDescription;
  }

  Map<String, dynamic> getAsMap() {
    return {
      'uid': uid,
      'name': name,
      'familyName': familyName,
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
      'memberSince': memberSince,
    };
  }

  factory UserModel.fromFirestore(Map<String, dynamic> data, String uid) {
    return UserModel(
      uid: uid,
      name: data['firstName'] ?? '',
      familyName: data['lastName'] ?? '',
      email: data['email'] ?? '',
      profilePictureUrl: data['profilePictureUrl'] ?? 'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250',
      phoneNumber: data['phoneNumber'] ?? '078255794815',
      city: data['city'] ?? 'Toronto',
      country: data['country'] ?? 'frane',
      age: data['age'] ?? 20,
      totalHoursWorked: data['totalHoursWorked'] ?? 20,
      totalJobsDone: data['totalJobsDone'] ?? 10,
      profileDescription: data['profileDescription'] ?? '',
      notation: data['notation'] ?? 4,
    );
  }

  String getKeyName(dynamic value) {
    Map<String, dynamic> fields = getAsMap();
    String keyName = fields.keys.firstWhere((k) => fields[k] == value, orElse: () => 'Key not found');
    return keyName;
  }
}
