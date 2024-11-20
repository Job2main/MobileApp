import 'package:flutter/material.dart';
import 'package:job2main/common/models/user.dart';
import 'package:job2main/features/employer/screens/profile/company_profile.dart';

class ProfilePageEmployee extends StatefulWidget {
  ProfilePageEmployee({super.key});
  final User user = User(
    name: 'John',
    familyName: 'Doe',
    email: 'john.doe@example.com',
    profilePictureUrl: 'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250',
    phoneNumber: '1 234 567 890',
    city: 'Toronto',
    country: 'Canada',
    age: 22,
    totalHoursWorked: 100,
    totalJobsDone: 10,
    profileDescription:
        'I am a passionate and dedicated worker with extensive experience in customer service and team collaboration. I love working with people and contributing to my company’s success.',
    notation: 4,
  );

  @override
  _ProfilePageEmployeeState createState() => _ProfilePageEmployeeState();
}

class _ProfilePageEmployeeState extends State<ProfilePageEmployee> {
  Widget _buildCompanyProfileButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CompanyProfilePage()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      child: const Text('View Company Profile'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Profile'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_rounded),
            onPressed: () {
              // Navigate to settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.user.profilePictureUrl),
              ),
              const SizedBox(height: 20),
              Text(
                '${widget.user.name} ${widget.user.familyName}',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return Icon(
                    index < widget.user.notation ? Icons.star : Icons.star_border,
                    color: index < widget.user.notation ? Colors.yellow : Colors.grey,
                  );
                }),
              ),
              const SizedBox(height: 16),
              Text(
                widget.user.profileDescription,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 32),
              _buildCompanyProfileButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
