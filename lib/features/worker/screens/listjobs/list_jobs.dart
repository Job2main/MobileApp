import 'package:flutter/material.dart';
import 'package:job2main/common/models/job_controller.dart';
import 'package:job2main/common/widgets/job/job_card.dart';
import 'package:job2main/common/widgets/job/job_widgets.dart';
import 'package:job2main/common/widgets/search_bar.dart';
import 'package:job2main/features/worker/screens/myjobs/job_display.dart';

enum FilterStatus { 
  all,
}

class ListJobs extends StatefulWidget {
  final JobController controller = JobController();

  ListJobs({super.key}) {
    controller.createJob(1, 'Job 1', 'Description of job 1', 'Restaurant 1', DateTime.now(),
        DateTime.now().add(const Duration(days: 2)), 22, 'Toronto', 'John Doe', "10:10", "15:00");
    controller.createJob(2, 'Job 2', 'Description of job 2', 'Restaurant 2', DateTime.now(),
        DateTime.now().add(const Duration(days: 6)), 22, 'Toronto', 'John Doe', "10:10", "15:00");
    controller.createJob(3, 'Job 3', 'Description of job 3', 'Restaurant 3', DateTime.now(),
        DateTime.now().add(const Duration(days: 9)), 22, 'Toronto', 'John Doe', "10:10", "15:00");
    controller.createJob(4, 'Job 4', 'Description of job 4', 'Restaurant 4', DateTime.now(),
        DateTime.now().add(const Duration(days: 4)), 22, 'Toronto', 'John Doe', "10:10", "15:00");
  }

  @override
  _ListJobsState createState() => _ListJobsState();
}

class _ListJobsState extends State<ListJobs> {
  FilterStatus selectedFilter = FilterStatus.all;
  String searchQuery = '';

  void _onJobTap(BuildContext context, Job job) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => JobDisplay(job: job),
      ),
    );
  }

  Widget _buildFilterDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: DropdownButton<FilterStatus>(
        hint: const Text("Filter by Status"),
        value: selectedFilter,
        icon: const Icon(Icons.filter_list, color: Colors.black),
        isExpanded: true,
        items: FilterStatus.values.map((status) {
          return DropdownMenuItem<FilterStatus>(
            value: status,
            child: Text(status == FilterStatus.all ? "All" : status.toString().split('.').last),
          );
        }).toList(),
        onChanged: (status) {
          setState(() {
            selectedFilter = status!;
          });
        },
      ),
    );
  }

  List<Job> _filterJobs() {
    var filteredJobs = widget.controller.jobs;

    if (selectedFilter != FilterStatus.all) {
      filteredJobs = filteredJobs.where((job) => job.status.toString().split('.').last == selectedFilter.toString().split('.').last).toList();
    }

    if (searchQuery.isNotEmpty) {
      filteredJobs = filteredJobs.where((job) => job.title.toLowerCase().contains(searchQuery.toLowerCase())).toList();
    }

    return filteredJobs;
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
        JobLine(text: job.company, icon: Icons.business),
        const SizedBox(height: 8.0),
        JobLine(text: "${job.wageRange}/h", icon: Icons.attach_money),
        const SizedBox(height: 8.0),
        JobLine(text: job.location, icon: Icons.location_on),
        JobSchedule(startHour: job.startHour, endHour: job.endHour, startDate: job.startDate, endDate: job.endDate),
      ],
      onTap: () => _onJobTap(context, job),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          buildSearchBar("Search", (query) {
            setState(() {
              searchQuery = query;
            });
          }),
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
      title: const Text('JOBS'),
      centerTitle: false,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: Divider(color: Colors.black12),
      ),
    );
  }
}
