import 'package:flutter/material.dart';
import 'package:job2main/common/widgets/job/job_card.dart';
import 'package:job2main/common/widgets/job/job_widgets.dart';
import '../../controllers/job_controller.dart';
import './job_display.dart';

class MyJobsScreen extends StatelessWidget {
  final JobController controller = JobController();

  MyJobsScreen({super.key}) {
    controller.createJob(1, 'Job 1', 'Description of job 1', 'Restaurant 1', DateTime.now(), DateTime.now().add(const Duration(days: 2)), 22, 'Toronto', 'John Doe', "10:10", "15:00");
    controller.createJob(2, 'Job 2', 'Description of job 2', 'Restaurant 2', DateTime.now(), DateTime.now().add(const Duration(days: 6)), 22, 'Toronto', 'John Doe', "10:10", "15:00");
    controller.createJob(3, 'Job 3', 'Description of job 3', 'Restaurant 3', DateTime.now(), DateTime.now().add(const Duration(days: 9)), 22, 'Toronto', 'John Doe', "10:10", "15:00");
    controller.createJob(4, 'Job 4', 'Description of job 4', 'Restaurant 4', DateTime.now(), DateTime.now().add(const Duration(days: 4)), 22, 'Toronto', 'John Doe', "10:10", "15:00");
  }

  void _onJobTap(BuildContext context, Job job) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => JobDisplay(job: job),
      ),
    );
  }

  Widget _getJobCard(Job job, BuildContext context) {
    return JobCard(
      job: job,
      jobWidgets: [
        JobTitle(title: job.title),
        JobDescription(description: job.description),
        JobSchedule(startHour: job.startHour, endHour: job.endHour, startDate: job.startDate, endDates: job.endDate),
      ],
      onTap: () => _onJobTap(context, job),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MY JOBS'),
        centerTitle: false,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(color: Colors.black12),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center (
            child: Column(
              children: controller.jobs.map((job) => _getJobCard(job, context)).toList(),
            )
          ),
        ),
      ),
    );
  }
}