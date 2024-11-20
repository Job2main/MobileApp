import 'package:flutter/material.dart';

class ApplicantDetailsPage extends StatelessWidget {
  final String name;
  final String photoUrl;
  final int age;
  final String description;
  final String cvLink;
  final List<String> certifications;
  final List<String> reviews;
  final String schedule;

  const ApplicantDetailsPage({
    super.key,
    required this.name,
    required this.photoUrl,
    required this.age,
    required this.description,
    required this.cvLink,
    required this.certifications,
    required this.reviews,
    required this.schedule,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Applicant: $name'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Applicant Basic Information
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(photoUrl),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Age: $age',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Description
            const Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),

            // CV
            const Text(
              'CV:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                // Open CV logic (e.g., open a URL or download file)
              },
              child: Text(
                'View CV',
                style: TextStyle(fontSize: 16, color: Colors.blue.shade700, decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(height: 16),

            // Certifications
            const Text(
              'Certifications:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: certifications.map((cert) {
                return Text(
                  '- $cert',
                  style: const TextStyle(fontSize: 16),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),

            // Reviews
            const Text(
              'Reviews:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: reviews.map((review) {
                return Text(
                  '- "$review"',
                  style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),

            // Schedule
            const Text(
              'Schedule:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              schedule,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),

            // Actions
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Accept application logic
                    },
                    child: const Text('Accept Application'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Send request logic
                    },
                    child: const Text('Send Request'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Generate and sign contract logic
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text('Generate & Sign Contract'),
            ),
          ],
        ),
      ),
    );
  }
}
