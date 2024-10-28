import 'package:flutter/material.dart';
import 'package:job2main/common/models/job_controller.dart';
import 'package:job2main/common/widgets/buttons/default_button.dart';
import 'package:job2main/common/widgets/job/job_card.dart';
import 'package:job2main/common/widgets/job/job_widgets.dart';
import 'package:job2main/common/widgets/search_bar.dart';
import 'package:job2main/features/worker/screens/myjobs/job_display.dart';

enum FilterStatus {
  location,
  company,
  contactName,
  minWage,
  maxWage,
}

const Map<FilterStatus, String> filterStatusMap = {
  FilterStatus.maxWage: 'wageRange',
  FilterStatus.minWage: 'wageRange',
};

class ListJobs extends StatefulWidget {
  final JobController controller = JobController();

  ListJobs({super.key}) {
    controller.createJob(1, 'Job 1', 'Description of job 1', 'Restaurant 1', DateTime.now(),
        DateTime.now().add(const Duration(days: 2)), 21, 'Toronto', 'John Doe', "10:10", "15:00");
    controller.createJob(2, 'Job 2', 'Description of job 2', 'Restaurant 2', DateTime.now(),
        DateTime.now().add(const Duration(days: 6)), 22, 'Toronto', 'John Doe', "10:10", "15:00");
    controller.createJob(3, 'Job 3', 'Description of job 3', 'Restaurant 3', DateTime.now(),
        DateTime.now().add(const Duration(days: 9)), 24, 'Vancouver', 'John Doe', "10:10", "15:00");
    controller.createJob(4, 'Job 4', 'Description of job 4', 'Restaurant 4', DateTime.now(),
        DateTime.now().add(const Duration(days: 4)), 25, 'Toronto', 'John Doe', "10:10", "15:00");
  }

  @override
  _ListJobsState createState() => _ListJobsState();
}

class _ListJobsState extends State<ListJobs> {
  String searchQuery = '';
  Map<FilterStatus, String> activeFilters = {}; // Stores active filters

  List<Widget> jobDisplayWidgets() {
    return [
      defaultButton(Icons.description, const Text("Postuler"), backgroundColor: Colors.green, () {
        print('Postuler button pressed');
      }),
      defaultButton(Icons.message, const Text('Message'), () {
        print('Message button pressed');
      }),
    ];
  }

  void _onJobTap(BuildContext context, Job job) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => JobDisplay(job: job, children: jobDisplayWidgets()),
      ),
    );
  }

  void _showFilterDialog(FilterStatus status) {
    TextEditingController inputController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Set Filter for ${status.toString().split('.').last}"),
          content: TextField(
            controller: inputController,
            decoration: const InputDecoration(labelText: 'Enter filter criteria'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Close"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  activeFilters[status] = inputController.text;
                });
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  Widget _buildFilterBox() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Wrap(
              spacing: 8.0,
              children: activeFilters.entries.map((entry) {
                return Chip(
                  label: Text("${entry.key.toString().split('.').last}: ${entry.value}"),
                  onDeleted: () {
                    setState(() {
                      activeFilters.remove(entry.key);
                    });
                  },
                );
              }).toList(),
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add, color: Colors.blue),
          onPressed: _showFilterSelectionDropdown,
        ),
      ],
    );
  }


  void _showFilterSelectionDropdown() async {
    FilterStatus? selected = await showDialog<FilterStatus>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text("Select a filter"),
          children: FilterStatus.values
              .map((status) => SimpleDialogOption(
                    onPressed: () => Navigator.pop(context, status),
                    child: Text(status.toString().split('.').last),
                  ))
              .toList(),
        );
      },
    );

    if (selected != null) {
      _showFilterDialog(selected);
    }
  }

  bool returnValue(String filterValue, String jobValue, String filterKey) {
    switch (filterKey) {
      case 'minWage':
        return double.parse(filterValue) <= double.parse(jobValue);
      case 'maxWage':
        return double.parse(filterValue) >= double.parse(jobValue);
      default:
        return filterValue == jobValue;
    }
  }

  String getFilterName(FilterStatus status) {
    if (filterStatusMap[status] != null) {
      return filterStatusMap[status]!;
    }
    return status.toString().split('.').last;
  }

  List<Job> _filterJobs() {
    var filteredJobs = widget.controller.jobs;

    if (activeFilters.isNotEmpty) {
      filteredJobs = filteredJobs.where((job) {
        return activeFilters.entries.every((entry) {
          final filterKey = getFilterName(entry.key);
          final filterValue = entry.value.toLowerCase();
          if (job.getAsMap()[filterKey] == null) return false;
          final jobValue = job.getAsMap()[filterKey]?.toString().toLowerCase() ?? '';

          return returnValue(filterValue, jobValue, entry.key.toString().split('.').last);
        });
      }).toList();
    }

    if (searchQuery.isNotEmpty) {
      filteredJobs = filteredJobs
          .where((job) => job.title.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
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
        JobSchedule(
            startHour: job.startHour,
            endHour: job.endHour,
            startDate: job.startDate,
            endDate: job.endDate),
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
          _buildFilterBox(),
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
