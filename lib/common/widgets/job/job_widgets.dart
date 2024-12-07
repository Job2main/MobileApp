import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:job2main/common/models/job_controller.dart';

Widget displayJobStatus(String status) {
  const colorsList = {
    'completed': Colors.green,
    'comfirmed': Colors.green,
    'refused': Colors.red,
    'pending': Colors.grey,
  };

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        decoration: BoxDecoration(
          color: colorsList[status] ?? Colors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          status,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ],
  );
}

class JobTitle extends StatelessWidget {
  final String title;

  const JobTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.black, // Title color
      ),
    );
  }
}

class JobDescription extends StatelessWidget {
  final String description;

  const JobDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8.0),
        Text(
          description,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 8.0),
      ],
    );
  }
}

String getMonthName(String monthNumber, {bool fullName = false}) {
  final DateTime date = DateTime(0, int.parse(monthNumber));
  final DateFormat formatter = DateFormat(fullName ? 'MMMM' : 'MMM');
  return formatter.format(date);
}

class JobSchedule extends StatelessWidget {
  final String startHour;
  final String endHour;
  final DateTime startDate;
  final DateTime endDate;

  const JobSchedule(
      {super.key,
      required this.startHour,
      required this.endHour,
      required this.startDate,
      required this.endDate});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8.0),
        _buildScheduleRow(),
        const SizedBox(height: 8.0),
        _buildDateRow(),
      ],
    );
  }

  Widget _buildScheduleRow() {
    return JobLine(text: '$startHour - $endHour', icon: Icons.access_time);
  }

  Widget _buildDateRow() {
    return Row(
      children: [
        JobLine(text: '${_buildDateText(startDate)} - ${_buildDateText(endDate)}', icon: Icons.date_range),
        const SizedBox(width: 8.0),
      ],
    );
  }

  String _buildDateText(DateTime date) {
    return '${date.day} ${getMonthName(date.month.toString())}';
  }
}

class JobLine extends StatelessWidget {
  final String text;
  final IconData icon;

  const JobLine({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.black, size: 20),
        const SizedBox(width: 8.0),
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class AlignJob extends StatelessWidget {
  final Job job;

  const AlignJob({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => (const Scaffold()),
              ));
        },
        child: const Text('More Information'),
      ),
    );
  }
}
