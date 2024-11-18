import 'package:flutter/material.dart';
import 'package:job2main/common/models/job_controller.dart';
import 'package:job2main/utils/formatters/formatter.dart';

enum JobFilterStatus {
  pending,
  completed,
  refused,
  requested,
}

const statusList = {
  'pending': [JobFilterStatus.pending, Colors.blueAccent],
  'completed': [JobFilterStatus.completed, Colors.orange],
  'refused': [JobFilterStatus.refused, Colors.red],
  'requested': [JobFilterStatus.requested, Colors.yellow],
};

Widget buildJobCardContent(Job job, BuildContext context, Widget jobWidgets, {void Function()? onTap, List<Widget>? topBar}) {
  return ListTile(
    leading: const CircleAvatar(
        backgroundImage:
            AssetImage('assets/images/job_placeholder.png')), // Change this hard coded image
    title: Stack(
      children: [
        Text(
          job.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        ...?topBar,
      ],
    ),
    subtitle: jobWidgets,
    onTap: onTap,
  );
}

Widget buildJobCardSubtitle(Job job, List<Widget> jobWidgets) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
        ...jobWidgets
    ]
  );
}

Widget buildStatusTabs(List<Widget> widgets) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Padding(
      padding: const EdgeInsets.only(left: 16), // Adjust left padding as needed
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...widgets,
        ],
      ),
    ),
  );
}

Widget buildJobCardBottomBar(Job job, List<Widget> widgets, var statusList, {JobFilterStatus? selectedStatus, Color? defaultColor = Colors.grey}) {
  Color? statusColor =
      statusList[selectedStatus.toString().split('.').last.toLowerCase()]?[1] as Color? ?? defaultColor;
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
        ...widgets,
      ],
    ),
  );
}

Widget jobLine(String text, {Color? iconColor = Colors.black, IconData? icon, Color? color, FontWeight? fontWeight}) {
  return Row(
    children: [
      if (icon != null) Icon(icon, color: iconColor),
      if (icon != null) const SizedBox(width: 1),
      Text(
        text,
        style: TextStyle(color: color, fontWeight: fontWeight),
      ),
    ],
  );
}

Widget getJobStartDate(Job job) {
  return Text(
    '${job.startDate.weekdayToString()}, ${job.startHour}',
    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  );
}

Widget getJobWageRange(Job job) {
  return Text(
    '${job.wageRange} \$ / h',
    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  );
}

Widget getJobCompletedOn(Job job) {
  String date = job.startDate.toString().split(' ')[0];
  String jobStatus = job.status.toString().split('.').last.toLowerCase();
  if (jobStatus == JobFilterStatus.completed.toString().split('.').last.toLowerCase()) {
    date = "Completed on ${job.endDate.toString().split(' ')[0]}";
  }
  return Text(
    date,
    style: const TextStyle(color: Colors.grey, fontSize: 13),
  );
}

Widget buildBubble(String text, {Color? color, FontWeight? fontWeight, IconData? icon}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
    decoration: BoxDecoration(
      color: Colors.grey.shade300, // Background color
      borderRadius: BorderRadius.circular(20.0), // Rounded edges for the bubble
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) Icon(icon, color: Colors.black87, size: 13,),
        const SizedBox(width: 5), 
        Text(
          text,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}


