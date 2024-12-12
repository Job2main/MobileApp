import 'package:flutter/material.dart';
import 'package:job2main/common/controllers/user_controller.dart';
import 'package:job2main/common/models/user.dart';
import 'package:job2main/features/employer/screens/profile/company_profile.dart';
import 'package:provider/provider.dart';

class ProfilePageEmployee extends StatefulWidget {
  ProfilePageEmployee({super.key});
  late UserModel userModel;
  late UserController userController;

  @override
  _ProfilePageEmployeeState createState() => _ProfilePageEmployeeState();
}

class _ProfilePageEmployeeState extends State<ProfilePageEmployee> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.userController = Provider.of<UserController>(context, listen: false);
    widget.userModel = widget.userController.userModel!;
  }

  Widget _buildCompanyProfileButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CompanyProfilePage()),
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
                backgroundImage: NetworkImage(widget.userModel.profilePictureUrl),
              ),
              const SizedBox(height: 20),
              Text(
                '${widget.userModel.firstName} ${widget.userModel.lastName}',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return Icon(
                    index < widget.userModel.notation ? Icons.star : Icons.star_border,
                    color: index < widget.userModel.notation ? Colors.yellow : Colors.grey,
                  );
                }),
              ),
              const SizedBox(height: 16),
              Text(
                widget.userModel.profileDescription,
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
