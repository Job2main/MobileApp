import 'package:flutter/material.dart';
import 'package:job2main/common/models/job_controller.dart';

class RequestedJobsPage extends StatelessWidget {
  final Job job;

  const RequestedJobsPage({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Requested Job: ${job.title}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Job Request Details:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Title: ${job.title}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Company: ${job.company}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Location: ${job.location}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Actions:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Accept job request logic
              },
              child: const Text('Accept Request'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Decline job request logic
              },
              child: const Text('Decline Request'),
            ),
          ],
        ),
      ),
    );
  }
}
