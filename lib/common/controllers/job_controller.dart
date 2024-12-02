import 'package:job2main/common/models/job.dart';

class JobController {
  List<Job> jobs = [];

  Job getJob(int id) {
    return jobs.firstWhere((job) => job.id == id);
  }

  void createJob(
    int id,
    String title,
    String description,
    String company,
    DateTime startDate,
    DateTime endDate,
    int wageRange,
    String location,
    String contactName,
    String startHour,
    String endHour,
    {JobStatus status = JobStatus.pending}
  ) {
    Job newJob = Job(
        id: id,
        title: title,
        description: description,
        company: company,
        startDate: startDate,
        endDate: endDate,
        wageRange: wageRange,
        startHour: startHour,
        endHour: endHour,
        totalNumberOfHours: 0,
        contactName: contactName,
        location: location,
        status: status
    );
    jobs.add(newJob);
  }

  void updateJob(int id, Map<String, dynamic> updates) {
    Job job = getJob(id);
    job.updateJob(updates);
  }

  void deleteJob(int id) {
    jobs.removeWhere((job) => job.id == id);
  }
}