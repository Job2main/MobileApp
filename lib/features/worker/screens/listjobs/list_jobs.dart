import 'package:flutter/material.dart';
import 'package:job2main/common/controllers/job_controller.dart';
import 'package:job2main/common/controllers/user_controller.dart';
import 'package:job2main/common/models/job.dart';
import 'package:job2main/common/controllers/job_controller.dart';
import 'package:job2main/common/controllers/user_controller.dart';
import 'package:job2main/common/models/job.dart';
import 'package:job2main/common/widgets/app_bar.dart';
import 'package:job2main/common/widgets/buttons/default_button.dart';
import 'package:job2main/common/widgets/filters.dart';
import 'package:job2main/common/widgets/job/job_card.dart';
import 'package:job2main/common/widgets/job/job_widgets.dart';
import 'package:job2main/common/widgets/job/new_job_card.dart';
import 'package:job2main/common/widgets/job/new_job_widgests.dart';
import 'package:job2main/common/widgets/search_bar.dart';
import 'package:job2main/features/worker/screens/myjobs/job_display.dart';
import 'package:job2main/utils/formatters/formatter.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

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

  void _onDeleted(Object status) {
    setState(() {
      activeFilters.remove(status as FilterStatus);
    });
  }

  void _addFilter(FilterStatus status, String value) {
    setState(() {
      activeFilters[status] = value;
    });
  }

  void _showFilterSelectionDropdown() async {
    FilterStatus? selected = await showDialog<FilterStatus>(
      context: context,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (BuildContext dialogContext, void Function(void Function()) setState) {
            return SimpleDialog(
              title: const Text("Select a filter"),
              children: [
                ...FilterStatus.values.map(
                  (status) => SimpleDialogOption(
                    onPressed: () => Navigator.pop(dialogContext, status),
                    child: Text(status.toString().split('.').last),
                  ),
                ),
                buildFilterBox(activeFilters, (status) {
                  setState(() {
                    activeFilters.remove(status as FilterStatus);
                  });
                  _onDeleted(status);
                }),
              ],
            );
          },
        );
      },
    );

    if (selected != null && mounted) {
      showFilterDialog(context, selected, (value) {
        if (value.isNotEmpty) _addFilter(selected, value);
      });
    }
  }

  bool returnValue(String filterValue, String jobValue, String filterKey) {
    switch (filterKey) {
      case 'minWage':
        return double.parse(filterValue) <= double.parse(jobValue);
      case 'maxWage':
        return double.parse(filterValue) >= double.parse(jobValue);
      default:
        return jobValue.contains(filterValue);
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

  Widget _getDate(Job job) {
    String jobStatus = job.status.toString().split('.').last.toLowerCase();
    String date = "${job.startDate.weekdayToString()}, ${job.startHour}";
    if (jobStatus == JobFilterStatus.pending.toString().split('.').last.toLowerCase()) {
      date = '${job.startHour} - ${job.endHour}h';
    }
    return jobLine(date, color: Colors.white, fontWeight: FontWeight.bold);
  }

  Widget _getBottomBar(Job job) {
    return buildJobCardBottomBar(
        job,
        [
          _getDate(job),
          getJobWageRange(job),
        ],
        statusList,
        defaultColor: Colors.blueAccent);
  }

  Widget _getSubTitle(BuildContext context, Job job) {
    return buildJobCardSubtitle(
      job,
      [
        jobLine(job.company),
        const SizedBox(width: 5),
        buildBubble(job.location, icon: Icons.location_on),
      ],
    );
  }

  Widget _getCardContent(BuildContext context, Job job) {
    return buildJobCardContent(
      job,
      context,
      _getSubTitle(context, job),
      topBar: [
        Align(
          alignment: Alignment.topRight,
          child: getJobCompletedOn(job),
        ),
      ],
      onTap: () => _onJobTap(context, job),
    );
  }

  List<Widget> _caller(BuildContext context) {
    return _filterJobs()
        .map((job) => buildJobCard(
              job,
              context,
              [_getCardContent(context, job), const SizedBox(height: 3), _getBottomBar(job)],
            ))
        .toList();
  }

  Widget _buildTop(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 48,
          child: buildFilter(_showFilterSelectionDropdown),
        ),
        Expanded(
          child: buildSearchBar("Search", (query) {
            setState(() {
              searchQuery = query;
            });
          }, context),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    UserController userController = Provider.of<UserController>(context);
    return Scaffold(
      appBar: BuildAppBar(
        name: userController.userModel!.name,
        profileImageUrl: userController.userModel!.profilePictureUrl,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          _buildTop(context),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: _caller(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
