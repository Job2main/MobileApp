import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:job2main/common/widgets/buttons/default_button.dart';
import 'package:job2main/common/widgets/job/job_widgets.dart';
import '../../controllers/job_controller.dart';


class JobDisplay extends StatelessWidget {
  final Job job;
  const JobDisplay({super.key, required this.job});

  Widget _buildJobInfo() {
    return _buildCard(
      [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRow(Icons.business, 'Company', job.company),
            _buildRow(Icons.date_range, 'Start Date', "${DateFormat('dd').format(job.startDate)} ${getMonthName(job.startDate.month.toString())}"),
            _buildRow(Icons.date_range, 'End Date', "${DateFormat('dd').format(job.endDate)} ${getMonthName(job.endDate.month.toString())}"),
            _buildRow(Icons.attach_money, 'Wage', '\$${job.wageRange}/hour'),
            _buildRow(Icons.access_time, 'Hours', '${job.startHour} - ${job.endHour}'),
            _buildRow(Icons.location_on, 'Location', job.location),
            _buildRow(Icons.person, 'Contact', job.contactName),
            displayJobStatus(job.status.toString().split('.').last),
          ],
        ),
        const SizedBox(height: 16),
        _buildConditionalButton(),  // Only the status-dependent button is added here
      ], "Information Additionnelle",
    );
  }

  Widget _buildRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.black54),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              '$label: ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionBox() {
    return _buildCard(
      [
        SizedBox(
          width: double.infinity,
          child: Text(
              job.description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
        ),
      ], "Description",
    );
  }

  Widget _buildCard(List<Widget> children, String title) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildConditionalButton() {
    // Return a specific button based on the job status
    if (job.status == CompanyJobStatus.comfirmed) {
      return defaultButton(Icons.person, const Text('See Employee'), () {
        print('See Employee button pressed');
      });
    } else if (job.status == CompanyJobStatus.review) {
      return defaultButton(Icons.person_search, const Text('See the Candidate'), () {
        print('See the Candidate button pressed');
      });
    } else if (job.status == CompanyJobStatus.waiting) {
      return defaultButton(Icons.edit, const Text('Modify Job'), () {
        print('Modify Job button pressed');
      });
    }
    return const SizedBox.shrink(); // Empty widget if no valid status
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildDescriptionBox(),
              _buildJobInfo(),  // _buildJobInfo now includes only the status-based button
              const SizedBox(height: 16),
              if (job.status == CompanyJobStatus.comfirmed)
                defaultButton(Icons.message, const Text('Message'), () {
                  print('Message button pressed');
                }),
              defaultButton(Icons.description, const Text("Voir le contrat"), () {
                print('Contract button pressed');
              }),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(job.title),
      centerTitle: false,
      elevation: 0,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: Divider(color: Colors.black12),
      ),
    );
  }
}
