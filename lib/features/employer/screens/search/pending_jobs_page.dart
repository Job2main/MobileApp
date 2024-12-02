import 'package:flutter/material.dart';
import 'package:job2main/common/models/job.dart';
import 'package:job2main/features/employer/screens/search/applicant_detail_page.dart';

class PendingJobsPage extends StatelessWidget {
  final Job job;

  const PendingJobsPage({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pending Job: ${job.title}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Applicants for this job:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 3, // Replace with the actual number of applicants
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text('A$index'),
                    ),
                    title: Text('Applicant ${index + 1}'),
                    subtitle: const Text('Applied on: 2024-11-20'),
                    onTap: () {
                      // Navigate to detailed page for the selected applicant
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ApplicantDetailsPage(
                            name: 'Applicant ${index + 1}',
                            photoUrl: 'https://via.placeholder.com/150',
                            age: 25 + index,
                            description: 'A highly motivated professional with experience in...',
                            cvLink: 'https://example.com/cv.pdf',
                            certifications: ['Certification 1', 'Certification 2'],
                            reviews: ['Very professional', 'Excellent skills'],
                            schedule: 'Monday to Friday, 9am - 5pm',
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
