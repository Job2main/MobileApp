import 'package:flutter/material.dart';
import 'package:job2main/common/models/job.dart';

Widget buildJobCard(Job job, BuildContext context, List<Widget> jobWidgets) {
  return Column(
    children: [
      Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...jobWidgets,
          ],
        ),
      ),
      const SizedBox(height: 8)
    ],
  );
}