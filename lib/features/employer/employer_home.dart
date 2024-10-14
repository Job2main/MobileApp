import 'package:flutter/material.dart';

class EmployerHomeScreen extends StatelessWidget {
  const EmployerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employer Home'),
      ),
      body: const Center(
        child: Text('Welcome Employer'),
      ),
    );
  }
}
