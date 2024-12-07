import 'package:flutter/material.dart';
import 'package:job2main/common/models/job_controller.dart';

class RefusedJobsPage extends StatelessWidget {
  final Job job;

  const RefusedJobsPage({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Refused Job: ${job.title}'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reason for Refusal:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'The application for this job was refused due to the following reasons:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '- Lack of required experience.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '- Misalignment with company requirements.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Further Details:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'You can reapply or contact the company for more information.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
