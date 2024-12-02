import 'package:flutter/material.dart';
import 'package:job2main/common/models/job.dart';

class JobDetailScreen extends StatelessWidget {
  final Job job;

  const JobDetailScreen({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(job.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Job Title and Company
              Text(
                job.title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Company: ${job.company}',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              const SizedBox(height: 16),

              // Ideal Candidate Tags
              const Text(
                'IDEAL CANDIDATE',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildTag('Attentive'),
                  _buildTag('Reliable'),
                  _buildTag('Team-oriented'),
                  _buildTag('Efficient'),
                ],
              ),
              const SizedBox(height: 16),

              // Salary Section
              _buildDetailCard(
                title: 'SALARY',
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$${job.wageRange}/h',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Negotiable',
                      style: TextStyle(fontSize: 14, color: Colors.grey[300]),
                    ),
                  ],
                ),
                backgroundColor: Colors.blue,
              ),
              const SizedBox(height: 16),

              // Location Section
              _buildDetailCard(
                title: 'LOCATION',
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job.location,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        // Open map logic here
                      },
                      child: const Row(
                        children: [
                          Text(
                            'Open in Maps',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          Icon(Icons.arrow_forward, color: Colors.white, size: 16),
                        ],
                      ),
                    ),
                  ],
                ),
                backgroundColor: Colors.pink,
              ),
              const SizedBox(height: 16),

              // Work Conditions Button
              _buildActionButton(
                label: 'WORK CONDITIONS',
                backgroundColor: Colors.orange,
                onTap: () {
                  // Navigate to work conditions screen or show details
                },
              ),
              const SizedBox(height: 16),

              // Contact Button
              _buildActionButton(
                label: 'CONTACT',
                backgroundColor: Colors.lightBlue,
                onTap: () {
                  // Navigate to contact screen or show details
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Method: Tag Widget
  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),
      ),
    );
  }

  // Helper Method: Detail Card
  Widget _buildDetailCard({
    required String title,
    required Widget content,
    required Color backgroundColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: backgroundColor.withOpacity(0.5),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 8),
          content,
        ],
      ),
    );
  }

  // Helper Method: Action Button
  Widget _buildActionButton({
    required String label,
    required Color backgroundColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: backgroundColor.withOpacity(0.5),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const Icon(Icons.arrow_forward, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
