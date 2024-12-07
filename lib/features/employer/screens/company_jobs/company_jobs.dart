import 'package:flutter/material.dart';
import 'package:job2main/common/models/job_controller.dart';
import 'package:job2main/features/employer/screens/company_jobs/job_detail_screen.dart';

class CompanyJobs extends StatefulWidget {
  final JobController controller = JobController();

  CompanyJobs({super.key}) {
    controller.createJob(
        1, 'Waiter/ess', 'Nonna cucina', 'MyCompany', DateTime.now(), DateTime.now().add(const Duration(days: 1)), 25, 'Toronto', 'Jane Doe', "12:00", "19:30",
        status: JobStatus.pending);
    controller.createJob(
        2, 'Bartender', 'El Colon', 'MyCompany', DateTime.now(), DateTime.now().add(const Duration(days: 3)), 22, 'Toronto', 'Jane Doe', "19:00", "00:00",
        status: JobStatus.pending);
    controller.createJob(
        3, 'Dishwasher', 'Casa Amor', 'MyCompany', DateTime.now(), DateTime.now().add(const Duration(days: 7)), 18, 'Vaughan', 'Jane Doe', "19:00", "00:00",
        status: JobStatus.completed);
  }

  @override
  _CompanyJobsState createState() => _CompanyJobsState();
}

class _CompanyJobsState extends State<CompanyJobs> {
  JobStatus selectedStatus = JobStatus.pending;

  void _onJobTap(BuildContext context, Job job) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => JobDetailScreen(job: job),
      ),
    );
  }

  List<Job> _filteredJobs() {
    return widget.controller.jobs.where((job) => job.status == selectedStatus).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            color: Colors.white,
            child: const Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage('https://www.gravatar.com/avatar/placeholder'),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, Hannah',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Job Page',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Status Tabs
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTab(JobStatus.pending, 'Pending'),
                _buildTab(JobStatus.completed, 'Completed'),
              ],
            ),
          ),

          // Job List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _filteredJobs().length,
              itemBuilder: (context, index) {
                final job = _filteredJobs()[index];
                return GestureDetector(
                  onTap: () => _onJobTap(context, job),
                  child: _buildJobCard(job),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(JobStatus status, String label) {
    final bool isSelected = selectedStatus == status;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedStatus = status;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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

  Widget _buildJobCard(Job job) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Logo
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[200],
            child: Text(job.company[0].toUpperCase(), style: const TextStyle(fontSize: 24)),
          ),
          const SizedBox(width: 12),

          // Job Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  job.title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(job.company, style: TextStyle(color: Colors.grey[600])),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16, color: Colors.grey),
                    Text(job.location, style: TextStyle(color: Colors.grey[600])),
                  ],
                ),
              ],
            ),
          ),

          // Wage
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('\$${job.wageRange}/h', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('${job.startHour} - ${job.endHour}', style: TextStyle(color: Colors.grey[600])),
            ],
          ),
        ],
      ),
    );
  }
}
