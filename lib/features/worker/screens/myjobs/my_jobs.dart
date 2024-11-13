import 'package:flutter/material.dart';
import 'package:job2main/common/widgets/buttons/default_button.dart';
import '../../../../common/models/job_controller.dart';
import './job_display.dart';

enum FilterStatus {
  pending,
  completed,
  refused,
  requested,
}

const statusList = {
  'pending': [FilterStatus.pending, Colors.blue],
  'completed': [FilterStatus.completed, Colors.orange],
  'refused': [FilterStatus.refused, Colors.red],
  'requested': [FilterStatus.requested, Colors.yellow],
};

class MyJobsScreen extends StatefulWidget {
  final JobController controller = JobController();

  MyJobsScreen({super.key}) {
    controller.createJob(1, 'Waiter/ess', 'Description', 'Nonna Cucina', DateTime.now(),
        DateTime.now().add(const Duration(days: 2)), 22, 'Montreal', 'Hannah', "10:00", "15:00",
        status: JobStatus.completed);
    controller.createJob(10, 'Waiter/ess', 'Description', 'Nonna Cucina', DateTime.now(),
        DateTime.now().add(const Duration(days: 2)), 22, 'Montreal', 'Hannah', "10:00", "15:00",
        status: JobStatus.completed);
    controller.createJob(2, 'Bartender', 'Description', 'El Colon', DateTime.now(),
        DateTime.now().add(const Duration(days: 2)), 22, 'Montreal', 'Hannah', "10:00", "15:00",
        status: JobStatus.pending);
    controller.createJob(3, 'Bartenders', 'Descriptions', 'El Colons', DateTime.now(),
        DateTime.now().add(const Duration(days: 2)), 22, 'Montreal', 'Hannah', "10:00", "15:00",
        status: JobStatus.refused);
  }

  @override
  _MyJobsScreenState createState() => _MyJobsScreenState();
}

class _MyJobsScreenState extends State<MyJobsScreen> {
  FilterStatus selectedStatus = FilterStatus.pending;

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
        print('Contract button pressed');
      }),
      defaultButton(Icons.message, const Text('Message'), () {
        print('Message button pressed');
      }),
    ];
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Hello, Hannah', style: TextStyle(color: Colors.black)),
      backgroundColor: Colors.white,
      centerTitle: false,
      elevation: 0,
      actions: const [
        CircleAvatar(
          backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          radius: 20,
        ),
        SizedBox(width: 16),
      ],
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: Divider(color: Colors.black12),
      ),
    );
  }

  Widget _buildStatusTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 16), // Adjust left padding as needed
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (final entry in statusList.entries)
              _buildStatusTab(
                entry.value[0] as FilterStatus,
                entry.key.toUpperCase(),
                entry.value[1] as Color,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusTab(FilterStatus status, String text, Color color) {
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

  Widget _buildJobCard(Job job, BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildJobCardContent(job, context),
              _buildJobCardBottomBar(job),
            ],
          ),
        ),
        const SizedBox(height: 8)
      ],
    );
  }

  Widget _buildJobCardContent(Job job, BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(backgroundImage: AssetImage('assets/images/job_placeholder.png')),
      title: Text(
        job.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: _buildJobCardSubtitle(job),
      onTap: () => _onJobTap(context, job),
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

  Widget _buildJobCardSubtitle(Job job) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(job.company),
        const SizedBox(height: 4),
        Text(
          'Completed on ${job.startDate.toString().split(' ')[0]}, ${job.startHour}',
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildJobCardBottomBar(Job job) {
    Color statusColor =
        statusList[selectedStatus.toString().split('.').last.toLowerCase()]?[1] as Color? ??
            Colors.grey;

    return Container(
      decoration: BoxDecoration(
        color: statusColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${job.startDate.toString().split(' ')[0]}, ${job.startHour}',
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            '${job.wageRange} \$ / h',
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

// Helper function to convert weekday number to name
// extension WeekdayString on DateTime {
//   String weekdayToString() {
//     switch (weekday) {
//       case DateTime.monday:
//         return 'Monday';
//       case DateTime.tuesday:
//         return 'Tuesday';
//       case DateTime.wednesday:
//         return 'Wednesday';
//       case DateTime.thursday:
//         return 'Thursday';
//       case DateTime.friday:
//         return 'Friday';
//       case DateTime.saturday:
//         return 'Saturday';
//       case DateTime.sunday:
//         return 'Sunday';
//       default:
//         return '';
//     }
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          const SizedBox(height: 6),
          _buildStatusTabs(),
          const SizedBox(height: 4),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: _filterJobs().map((job) => _buildJobCard(job, context)).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
