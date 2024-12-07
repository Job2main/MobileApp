import 'package:flutter/material.dart';
import 'package:job2main/features/employer/screens/profile/job_list_page.dart';

class CompanyProfilePage extends StatelessWidget {
  const CompanyProfilePage({super.key});

  Widget _buildRoleCard(BuildContext context, String roleTitle, String roleDescription, int jobCount) {
    return GestureDetector(
      onTap: () {
        // Navigate to the job list page for the selected role
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => JobListPage(roleTitle: roleTitle),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blueAccent.shade100,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.shade100.withOpacity(0.4),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              roleTitle,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              roleDescription,
              style: const TextStyle(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 16),
            Text(
              '$jobCount jobs available',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
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
        title: const Text('Company Profile'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Company Header
              Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blueAccent.shade200,
                    child: const Text(
                      'C',
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nonna Cucina',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'We offer exceptional dining experiences with authentic Italian cuisine.',
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              const Text(
                'About Us',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 8),
              const Text(
                'Welcome to Nonna Cucina, where we serve authentic Italian cuisine. Our team is dedicated to creating unforgettable dining experiences.',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 24),

              const Text(
                'Job Roles We Offer',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 16),
              _buildRoleCard(
                context,
                'Waiter/Waitress',
                'Serve customers, take orders, and ensure a pleasant dining experience.',
                5,
              ),
              _buildRoleCard(
                context,
                'Bartender',
                'Mix and serve beverages, maintain the bar area, and provide excellent service.',
                3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
