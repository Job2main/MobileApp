class User {
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
  final DateTime memberSince = DateTime.now();

  User({
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

  String getKeyName(dynamic value) {
    Map<String, dynamic> fields = getAsMap();
    String keyName = fields.keys.firstWhere((k) => fields[k] == value, orElse: () => 'Key not found');
    return keyName;
  }
}