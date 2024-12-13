import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:job2main/common/controllers/user_controller.dart';
import 'package:job2main/common/models/user.dart';
import 'package:provider/provider.dart';
import 'parameters.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isEditing = false;
  late TextEditingController _controller;
  late UserModel? userModel;
  late UserController userController;

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _saveDescription() {
    setState(() {
      userModel?.profileDescription = _controller.text;
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
        SizedBox(
          width: double.infinity, // Take the maximum width of the screen
          // height: 150.0, // Set the desired fixed height
          child: TextField(
            controller: _controller,
            maxLines: null,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Editer la description',
            ),
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
          child: const Text('Sauvegarder'),
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
              userModel!.profileDescription,
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
          MaterialPageRoute(
              builder: (context) => ParametersPage(user: userModel!, userController: userController)),
        );
      },
    );
  }

  Widget _buildProfilePicture() {
    return CircleAvatar(
      radius: 50,
      backgroundImage: NetworkImage(userModel!.profilePictureUrl),
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
          '${userModel!.firstName} ${userModel!.lastName}',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Row(
          children: List.generate(5, (index) {
            return Icon(
              index < userModel!.notation ? Icons.star : Icons.star_border,
              color: index < userModel!.notation ? Colors.yellow : Colors.grey,
            );
          }),
        ),
      ],
    );
  }

  Widget _buildAdditionnalInfo() {
    return _buildInfo("Information additionel", [
      _buildInfoRow(Icons.work, '${userModel!.totalJobsDone} travaux effectués'),
      _buildInfoRow(Icons.work, '${userModel!.totalHoursWorked} heures travaillées'),
      _buildInfoRow(Icons.work, 'Membre depuis ${userModel!.createdAt.year}'),
    ]);
  }

  Widget _buildContactlInfo() {
    return _buildInfo("Information du contact", [
      _buildInfoRow(Icons.person, '${userModel!.age} ans'),
      _buildInfoRow(Icons.phone, '+${userModel!.phoneNumber}'),
      _buildInfoRow(Icons.email, userModel!.email),
      _buildInfoRow(Icons.location_on, '${userModel!.city}, ${userModel!.country}'),
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

  @override
  Widget build(BuildContext context) {
    userController = Get.find<UserController>();
    _controller = TextEditingController(text: userController.userModel?.profileDescription);

    return Scaffold(
        appBar: AppBar(
          title: const Text('PROFILE'),
          centerTitle: false,
          actions: [
            _paramsButton(context),
          ],
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1.0),
            child: Divider(color: Colors.black12),
          ),
        ),
        body: Obx(() {
          userModel = userController.userModel;
          if (userModel == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
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
          );
        }));
  }
}
