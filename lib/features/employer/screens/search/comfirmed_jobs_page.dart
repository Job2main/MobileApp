import 'package:flutter/material.dart';
import 'package:job2main/common/models/job.dart';

class ConfirmedJobsPage extends StatelessWidget {
  final Job job;

  const ConfirmedJobsPage({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmed Job: ${job.title}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Confirmed Job Details:',
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
                // Logic for canceling the job
              },
              child: const Text('Cancel Job'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Logic for marking job as completed
              },
              child: const Text('Mark as Completed'),
            ),
          ],
        ),
      ),
    );
  }
}
