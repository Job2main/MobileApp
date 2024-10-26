import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      const SizedBox(height: 8.0),
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

class JobCreator extends StatelessWidget {
  final String creator;

  const JobCreator({super.key, required this.creator});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.person, color: Colors.teal, size: 20), // Icon color
        const SizedBox(width: 8.0),
        Text(
          creator,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54, // Softer color for creator text
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
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
            color: Colors.black54, // Softer color for description text
          ),
        ),
        const SizedBox(height: 8.0),
      ],
    );
  }
}

class JobSchedule extends StatelessWidget {
  final String startHour;
  final String endHour;
  final DateTime startDate;
  final DateTime endDates;

  const JobSchedule({super.key, required this.startHour, required this.endHour, required this.startDate, required this.endDates});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildScheduleRow(),
        const SizedBox(height: 8.0),
        _buildDateRow(),
      ],
    );
  }

  Widget _buildScheduleRow() {
    return Row(
      children: [
        const Icon(Icons.access_time, color: Colors.black, size: 20),
        const SizedBox(width: 8.0),
        Text(
          '$startHour - $endHour',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildDateRow() {
    return Row(
      children: [
        const Icon(Icons.calendar_today, color: Colors.black, size: 20),
        const SizedBox(width: 8.0),
        _buildDateText(startDate),
        const Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: Text(
            '-',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        _buildDateText(endDates),
      ],
    );
  }

  String getMonthName(String monthNumber, {bool fullName = false}) {
    final DateTime date = DateTime(0, int.parse(monthNumber));
    final DateFormat formatter = DateFormat(fullName ? 'MMMM' : 'MMM');
    return formatter.format(date);
  }

  Widget _buildDateText(DateTime date) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Text(
        '${date.day} ${getMonthName(date.month.toString())}',
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black54,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
