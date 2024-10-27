import 'package:flutter/material.dart';

class WorkerHomeScreen extends StatelessWidget {
  const WorkerHomeScreen({super.key});

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
