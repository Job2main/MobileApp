import 'package:flutter/material.dart';
import 'package:job2main/common/controllers/job_controller.dart';
import 'package:job2main/common/controllers/user_controller.dart';
import 'package:job2main/common/widgets/app_bar.dart';
import 'package:get/get.dart';
import 'package:job2main/common/widgets/buttons/default_button.dart';
import 'package:job2main/common/widgets/job/new_job_card.dart';
import 'package:job2main/common/widgets/job/new_job_widgests.dart';
import 'package:job2main/utils/constants/enums.dart';
import 'package:job2main/utils/helpers/formatter.dart';
import 'package:job2main/features/worker/screens/myjobs/contract_viewer.dart';
import 'package:provider/provider.dart';
import '../../../../common/models/job.dart';
import './job_display.dart';

class MyJobsScreen extends StatefulWidget {
  final JobController controller = JobController();

  MyJobsScreen({super.key}) {
    controller.createJob("1", 'Waiter/ess', 'Description', 'Nonna Cucina', DateTime.now(),
        DateTime.now().add(const Duration(days: 2)), 22, 'Montreal', 'Hannah', "10:00", "15:00",
        status: JobStatus.completed);
    controller.createJob("10", 'Waiter/ess', 'Description', 'Nonna Cucina', DateTime.now(),
        DateTime.now().add(const Duration(days: 2)), 22, 'Montreal', 'Hannah', "10:00", "15:00",
        status: JobStatus.completed);
    controller.createJob("2", 'Bartender', 'Description', 'El Colon', DateTime.now(),
        DateTime.now().add(const Duration(days: 2)), 22, 'Montreal', 'Hannah', "10:00", "15:00",
        status: JobStatus.pending);
    controller.createJob("3", 'Bartenders', 'Descriptions', 'El Colons', DateTime.now(),
        DateTime.now().add(const Duration(days: 2)), 22, 'Montreal', 'Hannah', "10:00", "15:00",
        status: JobStatus.refused);
  }

  @override
  _MyJobsScreenState createState() => _MyJobsScreenState();
}

class _MyJobsScreenState extends State<MyJobsScreen> {
  JobFilterStatus selectedStatus = JobFilterStatus.pending;

  void _onJobTap(BuildContext context, Job job) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => JobDisplay(job: job, children: jobDisplayWidgets()),
      ),
    );
  }

  List<Job> _filterJobs() {
    return widget.controller.jobs
        .where((job) =>
            job.status.toString().split('.').last.toLowerCase() ==
            selectedStatus.toString().split('.').last.toLowerCase())
        .toList();
  }

  List<Widget> jobDisplayWidgets() {
    return [
      defaultButton(Icons.description, const Text("Voir le contrat"), () {
        Get.to(() => const ContractViewer());
      }),
      defaultButton(Icons.message, const Text('Message'), () {
        print('Message button pressed');
      }),
    ];
  }

  Widget _buildStatusTab(JobFilterStatus status, String text, Color color) {
    final bool isSelected = selectedStatus == status;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedStatus = status;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? color : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Widget _getSquaredPicture(String picturePath) {
  //   return ListTile(
  //     leading: SizedBox(
  //       width: 50.0, // Set the width of the square image
  //       height: 50.0, // Set the height of the square image
  //       child: Container(
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(8.0), // Set the border radius for rounded corners
  //           image: DecorationImage(
  //             image: AssetImage(picturePath),
  //             fit: BoxFit.cover,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

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
      selectedStatus: selectedStatus,
    );
  }

  Widget _getSubTitle(BuildContext context, Job job) {
    return buildJobCardSubtitle(
      job,
      [
        jobLine(job.company),
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
      onTap: selectedStatus != JobFilterStatus.refused ? () => _onJobTap(context, job) : () {},
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

  Widget _getStatusTabs() {
    return buildStatusTabs(
      [
        for (final entry in statusList.entries)
          _buildStatusTab(
            entry.value[0] as JobFilterStatus,
            entry.key.toUpperCase(),
            entry.value[1] as Color,
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find<UserController>();
    return Scaffold(
      appBar: BuildAppBar(
        name: userController.userModel!.firstName,
        profileImageUrl: userController.userModel!.profilePictureUrl,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          _getStatusTabs(),
          const SizedBox(height: 4),
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
