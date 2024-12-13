import 'package:flutter/material.dart';
import 'package:job2main/common/controllers/job_controller.dart';
import 'package:job2main/common/models/job.dart';
import 'package:job2main/features/employer/screens/search/comfirmed_jobs_page.dart';
import 'package:job2main/features/employer/screens/search/completed_jobs_page.dart';
import 'package:job2main/features/employer/screens/search/pending_jobs_page.dart';
import 'package:job2main/features/employer/screens/search/refused_jobs_page.dart';
import 'package:job2main/features/employer/screens/search/requested_jobs_page.dart';
import 'package:job2main/utils/constants/enums.dart';

class JobStatusFilterScreen extends StatefulWidget {
  final JobController controller = JobController();

  JobStatusFilterScreen({super.key}) {
    controller.createJob("1", 'Waiter/ess', 'Serve customers', 'Nonna Cucina', DateTime.now(),
        DateTime.now().add(const Duration(days: 2)), 22, 'Montreal', 'Hannah', "10:00", "15:00",
        status: JobStatus.completed);
    controller.createJob(
        "2",
        'Bartender',
        'Mix drinks and serve customers',
        'El Colon',
        DateTime.now(),
        DateTime.now().add(const Duration(days: 2)),
        22,
        'Montreal',
        'Hannah',
        "18:00",
        "23:00",
        status: JobStatus.pending);
    controller.createJob(
        "3",
        'Dishwasher',
        'Clean dishes and maintain kitchen hygiene',
        'Casa Amor',
        DateTime.now(),
        DateTime.now().add(const Duration(days: 1)),
        20,
        'Montreal',
        'Hannah',
        "19:00",
        "22:00",
        status: JobStatus.refused);
    controller.createJob(
        "4",
        'Chef',
        'Prepare meals and supervise kitchen staff',
        'Nonna Cucina',
        DateTime.now(),
        DateTime.now().add(const Duration(days: 3)),
        30,
        'Montreal',
        'Hannah',
        "09:00",
        "17:00",
        status: JobStatus.requested);
  }

  @override
  _JobStatusFilterScreenState createState() => _JobStatusFilterScreenState();
}

class _JobStatusFilterScreenState extends State<JobStatusFilterScreen> {
  List<JobStatus> selectedStatuses = [JobStatus.pending]; // Default filter

  void _onJobTap(BuildContext context, Job job) {
    if (job.status == JobStatus.pending) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PendingJobsPage(job: job),
        ),
      );
    } else if (job.status == JobStatus.completed) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CompletedJobsPage(job: job),
        ),
      );
    } else if (job.status == JobStatus.refused) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => RefusedJobsPage(job: job),
        ),
      );
    } else if (job.status == JobStatus.requested) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => RequestedJobsPage(job: job),
        ),
      );
    } else if (job.status == JobStatus.comfirmed) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ConfirmedJobsPage(job: job),
        ),
      );
    }
  }

  List<Job> _filterJobs() {
    return widget.controller.jobs.where((job) => selectedStatuses.contains(job.status)).toList();
  }

  Widget _buildFilterButton(JobStatus status, String label) {
    final bool isSelected = selectedStatuses.contains(status);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedStatuses.remove(status);
          } else {
            selectedStatuses.add(status);
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildFilterRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildFilterButton(JobStatus.pending, "Pending"),
          const SizedBox(width: 8),
          _buildFilterButton(JobStatus.completed, "Completed"),
          const SizedBox(width: 8),
          _buildFilterButton(JobStatus.refused, "Refused"),
          const SizedBox(width: 8),
          _buildFilterButton(JobStatus.requested, "Requested"),
          const SizedBox(width: 8),
          _buildFilterButton(JobStatus.comfirmed, "Confirmed"),
        ],
      ),
    );
  }

  Widget _buildJobCard(Job job) {
    return GestureDetector(
      onTap: () => _onJobTap(context, job),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Company logo or placeholder
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey[300],
              child: Text(
                job.company[0],
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 16),
            // Job details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    job.title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(job.company, style: TextStyle(color: Colors.grey[600])),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16, color: Colors.grey),
                      Text(job.location, style: TextStyle(color: Colors.grey[600])),
                    ],
                  ),
                ],
              ),
            ),
            // Job status and timing
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('\$${job.wageRange}/h',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('${job.startHour} - ${job.endHour}',
                    style: TextStyle(color: Colors.grey[600])),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Company Jobs'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Filter by Status',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildFilterRow(),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _filterJobs().length,
                itemBuilder: (context, index) {
                  final job = _filterJobs()[index];
                  return _buildJobCard(job);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
