import 'package:flutter/material.dart';
import 'package:job2main/features/employer/controllers/user.dart';
import '../../controllers/profile_page_controller.dart';
import '../../../../common/widgets/buttons/default_button.dart';

import 'parameters.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});
  final User user = User(
    name: 'John',
    familyName: 'Doe',
    email: 'john.doe@example.com',
    profilePictureUrl: 'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250',
    phoneNumber: '1 234 567 890',
    city: 'Toronto',
    country: 'Canada',
    company: 'Canada recipe',
    age: 22,
    totalStudentRecruted: 10,
    profileDescription: 'This is a description of the user. It can be a long text that describes the user and the company he/she works in more details.',
    jobNotation: 4,
  );

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isEditing = false;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.user.profileDescription);
  }

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _saveDescription() {
    setState(() {
      widget.user.profileDescription = _controller.text;
      _isEditing = false;
    });
  }

  Widget _buildDescription() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: _isEditing ? _buildEditDescription() : _buildDisplayDescription(),
    );
  }

  Widget _buildEditDescription() {
    return Column(
      children: [
        TextField(
          controller: _controller,
          maxLines: null,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Edit Description',
          ),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: _saveDescription,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            textStyle: const TextStyle(fontSize: 14),
          ),
          child: const Text('Save'),
        ),
      ],
    );
  }

  Widget _buildDisplayDescription() {
    return Stack(
      children: [
        GestureDetector(
          onTap: _toggleEdit,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              widget.user.profileDescription,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
                letterSpacing: 0.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Positioned(
          bottom: -15,
          left: -15,
          child: IconButton(
            icon: const Icon(Icons.edit, color: Colors.black87, size: 20),
            onPressed: _toggleEdit,
          ),
        ),
      ],
    );
  }

  Widget _paramsButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings_rounded),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ParametersPage(user: widget.user)),
        );
      },
    );
  }

  Widget _buildProfilePicture() {
    return CircleAvatar(
      radius: 50,
      backgroundImage: NetworkImage(widget.user.profilePictureUrl),
      backgroundColor: Colors.grey.shade200,
    );
  }

  Widget _buildUserNameNotation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${widget.user.name} ${widget.user.familyName}',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Row(
          children: List.generate(5, (index) {
            return Icon(
              index < widget.user.jobNotation ? Icons.star : Icons.star_border,
              color: index < widget.user.jobNotation ? Colors.yellow : Colors.grey,
            );
          }),
        ),
      ],
    );
  }

  Widget _buildContactInfo() {
    return _buildInfo("Contact Information", [
      _buildInfoRow(Icons.person, '${widget.user.age} years'),
      _buildInfoRow(Icons.phone, '+${widget.user.phoneNumber}'),
      _buildInfoRow(Icons.business, '${widget.user.company}'),
      _buildInfoRow(Icons.email, widget.user.email),
      _buildInfoRow(Icons.location_on, '${widget.user.city}, ${widget.user.country}'),
    ]);
  }

  Widget _buildAdditionalInfo() {
    return _buildInfo("Additional Information", [
      _buildInfoRow(Icons.work, '${widget.user.totalStudentRecruted} students recruited.'),
      _buildInfoRow(Icons.calendar_today, 'Member since ${DateTime.now().year - widget.user.age}'),
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

  Widget _buildCompanyProfileButton() {
    return defaultButton(
      Icons.business,
      const Text('Access Company Profile'),
      () {
        // Replace with your navigation logic to the Company Profile page
        print('Navigating to Company Profile');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PROFILE'),
        actions: [_paramsButton(context)],
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
              _buildContactInfo(),
              const SizedBox(height: 16),
              _buildAdditionalInfo(),  // Re-added the additional info section
              const SizedBox(height: 16),
              _buildCompanyProfileButton(),  // Add the new button here
            ],
          ),
        ),
      ),
    );
  }
}
