import 'package:job2main/common/models/job.dart';
import 'package:job2main/utils/constants/enums.dart';

class JobController {
  List<Job> jobs = [];

  Job getJob(String uuid) {
    return jobs.firstWhere((job) => job.uuid == uuid);
  }

  void createJob(
    String uuid,
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
        uuid: uuid,
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

  void updateJob(String uuid, Map<String, dynamic> updates) {
    Job job = getJob(uuid);
    job.updateJob(updates);
  }

  void deleteJob(String uuid) {
    jobs.removeWhere((job) => job.uuid == uuid);
  }
}