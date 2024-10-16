import 'package:flutter/material.dart';
import '../../controllers/job_controller.dart';
import './job_display.dart';

class MyJobsScreen extends StatelessWidget {
  final JobController controller = JobController();

  MyJobsScreen({super.key}) {
    controller.createJob(1, 'Job 1', 'Description of job 1', 'Restaurant 1', DateTime.now(), 10, 8, 'Toronto');
    controller.createJob(2, 'Job 2', 'Description of job 2', 'Restaurant 2', DateTime.now(), 15, 4, 'Montreal');
    controller.createJob(3, 'Job 3', 'Description of job 3', 'Restaurant 3', DateTime.now(), 20, 6, 'Vancouver');
  }

  Widget _addRow(String text, {IconData? icon, Color myColor=Colors.black, String title = ""}) {
    return Row(
      children: [
        if (icon != null) ...[
          Icon(icon, size: 18, color: Colors.black,),
          const SizedBox(width: 8),
        ],
        Text(
          text,
          style: TextStyle(
            color: myColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),
        if (title != "") ...[
          const Spacer(),
          Text(
            title,
            style: TextStyle(
              color: myColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildJobCard(Job job, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => JobDisplay(job: job),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 16.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _addRow(job.title, icon: Icons.work, myColor: Colors.black),
                const SizedBox(height: 8),
                _addRow(job.description, icon: Icons.description, myColor: Colors.black),
                const SizedBox(height: 8),
                _addRow(job.company, icon: Icons.business, myColor: Colors.black),
                const SizedBox(height: 8),
                _addRow(job.date.toString(), icon: Icons.date_range, myColor: Colors.black),
                const SizedBox(height: 8),
                _addRow('${job.wageRange} \$ per hour', icon: Icons.attach_money, myColor: Colors.black),
                const SizedBox(height: 8),
                _addRow('${job.numberOfHours} hours', icon: Icons.timer, myColor: Colors.black),
                const SizedBox(height: 8),
                _addRow(job.location, icon: Icons.location_on, myColor: Colors.black),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MY JOBS'),
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.black,
            height: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center (
            child: Column(
              children: controller.jobs.map((job) => _buildJobCard(job, context)).toList(),
            )
          ),
        ),
      ),
    );
  }
}