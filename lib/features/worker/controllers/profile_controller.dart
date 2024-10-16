class ProfileController {
  final String name;
  final String familyName;
  final String email;
  final String profilePictureUrl;
  final String phoneNumber;
  final String city;
  final String country;
  final int age;
  final int totalHoursWorked;
  final int totalJobsDone;
  final String profileDescription;
  final int notation;

  ProfileController({
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
}
