import 'package:flutter/material.dart';

class JobListPage extends StatelessWidget {
  final String roleTitle;

  const JobListPage({super.key, required this.roleTitle});

  Widget _buildJobCard(BuildContext context, String jobTitle, String wageRange, String schedule, String location) {
    return GestureDetector(
      onTap: () {
        // Navigate to detailed job information
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.pinkAccent.shade100,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.pinkAccent.shade100.withOpacity(0.4),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              jobTitle,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              'Wage: $wageRange',
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            Text(
              'Schedule: $schedule',
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            Text(
              'Location: $location',
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(roleTitle),
        backgroundColor: Colors.pinkAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Available Jobs',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 16),
              _buildJobCard(
                context,
                'Morning Shift',
                '\$15 - \$20/hour',
                '9:00 AM - 1:00 PM',
                'Montreal, QC',
              ),
              _buildJobCard(
                context,
                'Evening Shift',
                '\$15 - \$20/hour',
                '6:00 PM - 10:00 PM',
                'Montreal, QC',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
