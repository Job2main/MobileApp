import 'package:flutter/material.dart';
import 'package:job2main/common/widgets/job/job_widgets.dart';
import 'package:job2main/features/worker/controllers/job_controller.dart';

class JobCard extends StatelessWidget {
  final Job job;
  final List<Widget> jobWidgets;
  final clickable;
  final Function() onTap;

  const JobCard({super.key, required this.job, required this.jobWidgets, required this.onTap, this.clickable = true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: clickable ? onTap : null,
      borderRadius: BorderRadius.circular(15.0), // Ensures InkWell effect matches card radius
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: jobWidgets,
          ),
        ),
      ),
    );
  }
}
