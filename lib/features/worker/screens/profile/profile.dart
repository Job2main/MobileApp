import 'package:flutter/material.dart';
import '../../controllers/profile_controller.dart';
import 'parameters.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final ProfileController controller = ProfileController(
    name: 'John',
    familyName: 'Doe',
    email: 'john.doe@example.com',
    profilePictureUrl: 'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250',
    phoneNumber: '+1 234 567 890',
    city: 'Toronto',
    country: 'Canada',
    age: 22,
    totalHoursWorked: 100,
    totalJobsDone: 10,
    profileDescription: 'This is a description of the user. It can be a long text that describes the user in more details.',
    notation: 4,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PROFILE'),
        centerTitle: false,
        actions: [
          _paramsButton(context),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.black,
            height: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildProfilePicture(),
              const SizedBox(height: 20),
              _buildUserNameNotation(),
              const SizedBox(height: 0),
              _buildDescription(),
              const SizedBox(height: 22),
              _buildContactlInfo(),
              const SizedBox(height: 16),
              _buildAdditionnalInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        controller.profileDescription,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black87,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.italic,
          letterSpacing: 0.5,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _paramsButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings_rounded),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ParametersPage()),
        );
      },
    );
  }

  Widget _buildProfilePicture() {
    return CircleAvatar(
      radius: 50,
      backgroundImage: NetworkImage(controller.profilePictureUrl),
      backgroundColor: Colors.grey.shade200,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 15,
              offset: const Offset(0, 10),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserNameNotation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${controller.name} ${controller.familyName}',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Row(
          children: List.generate(5, (index) {
            return Icon(
              index < controller.notation ? Icons.star : Icons.star_border,
              color: index < controller.notation ? Colors.yellow : Colors.grey,
            );
          }),
        ),
      ],
    );
  }

  Widget _buildAdditionnalInfo() {
    return _buildInfo("Additional Information", [
      _buildInfoRow(Icons.work, '${controller.totalJobsDone} jobs done'),
      _buildInfoRow(Icons.work, '${controller.totalHoursWorked} hours worked'),
    ]);
  }

  Widget _buildContactlInfo() {
    return _buildInfo("Contact Information", [
      _buildInfoRow(Icons.person, '${controller.age} years old'),
      _buildInfoRow(Icons.phone, controller.phoneNumber),
      _buildInfoRow(Icons.email, controller.email),
      _buildInfoRow(Icons.location_on, '${controller.city}, ${controller.country}'),
    ]);
  }

  Widget _buildInfo(String title, List<Widget> children) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}