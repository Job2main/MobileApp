class User {
  String name;
  String familyName;
  String email;
  String profilePictureUrl;
  String phoneNumber;
  String city;
  String country;
  String company;
  int age;
  final int totalStudentRecruted;
  String profileDescription;
  final int jobNotation;
  final DateTime memberSince = DateTime.now();

  User({
    required this.name,
    required this.familyName,
    required this.email,
    required this.profilePictureUrl,
    required this.phoneNumber,
    required this.city,
    required this.country,
    required this.company,
    required this.age,
    required this.totalStudentRecruted,
    required this.profileDescription,
    required this.jobNotation,
  });

  void updateUserProfile(Map<String, dynamic> updates) {
    name = updates['name'] ?? name;
    familyName = updates['familyName'] ?? familyName;
    email = updates['email'] ?? email;
    profilePictureUrl = updates['profilePictureUrl'] ?? profilePictureUrl;
    phoneNumber = updates['phoneNumber'] ?? phoneNumber;
    city = updates['city'] ?? city;
    country = updates['country'] ?? country;
    company = updates['company'] ?? company;
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
      'company': company,
      'age': age,
      'totalStudentRecruted': totalStudentRecruted,
      'profileDescription': profileDescription,
      'jobNotation': jobNotation,
      'memberSince': memberSince,
    };
  }

  String getKeyName(dynamic value) {
    Map<String, dynamic> fields = getAsMap();
    String keyName = fields.keys.firstWhere((k) => fields[k] == value, orElse: () => 'Key not found');
    return keyName;
  }
}
