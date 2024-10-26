import 'package:flutter/material.dart';
import 'package:job2main/common/widgets/job/job_card.dart';
import 'package:job2main/common/widgets/job/job_widgets.dart';
import '../../controllers/job_controller.dart';
import './job_display.dart';

enum FilterStatus { 
  all,
  confirmed,
  refused,
  completed,
  pending 
}

class MyJobsScreen extends StatefulWidget {
  final JobController controller = JobController();

  MyJobsScreen({super.key}) {
    controller.createJob(1, 'Job 1', 'Description of job 1', 'Restaurant 1', DateTime.now(), DateTime.now().add(const Duration(days: 2)), 22, 'Toronto', 'John Doe', "10:10", "15:00", status: JobStatus.completed);
    controller.createJob(2, 'Job 2', 'Description of job 2', 'Restaurant 2', DateTime.now(), DateTime.now().add(const Duration(days: 6)), 22, 'Toronto', 'John Doe', "10:10", "15:00", status: JobStatus.comfirmed);
    controller.createJob(3, 'Job 3', 'Description of job 3', 'Restaurant 3', DateTime.now(), DateTime.now().add(const Duration(days: 9)), 22, 'Toronto', 'John Doe', "10:10", "15:00", status: JobStatus.refused);
    controller.createJob(4, 'Job 4', 'Description of job 4', 'Restaurant 4', DateTime.now(), DateTime.now().add(const Duration(days: 4)), 22, 'Toronto', 'John Doe', "10:10", "15:00");
  }

  @override
  _MyJobsScreenState createState() => _MyJobsScreenState();
}

class _MyJobsScreenState extends State<MyJobsScreen> {
  FilterStatus selectedStatus = FilterStatus.all;

  void _onJobTap(BuildContext context, Job job) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => JobDisplay(job: job),
      ),
    );
  }

  List<Job> _filterJobs() {
    if (selectedStatus == FilterStatus.all) return widget.controller.jobs;
    return widget.controller.jobs.where((job) => job.status.toString().split('.').last == selectedStatus.toString().split('.').last).toList();
  }

  Widget _buildFilterDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: DropdownButton<FilterStatus>(
        hint: const Text("Filter by Status"),
        value: selectedStatus,
        icon: const Icon(Icons.filter_list, color: Colors.teal),
        isExpanded: true,
        items: FilterStatus.values.map((status) {
          return DropdownMenuItem<FilterStatus>(
            value: status,
            child: Text(status == FilterStatus.all ? "All" : status.toString().split('.').last),
          );
        }).toList(),
        onChanged: (status) {
          setState(() {
            selectedStatus = status!;
          });
        },
      ),
    );
  }

  Widget _buildJobCards(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          children: _filterJobs().map((job) => _getJobCard(job, context)).toList(),
        ),
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
        displayJobStatus(job.status.toString().split('.').last),
      ],
      onTap: () => _onJobTap(context, job),
      clickable: job.status != JobStatus.refused,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildFilterDropdown(),
          Expanded(
            child: SingleChildScrollView(
              child: _buildJobCards(context),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('MY JOBS'),
      centerTitle: false,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: Divider(color: Colors.black12),
      ),
    );
  }
}
