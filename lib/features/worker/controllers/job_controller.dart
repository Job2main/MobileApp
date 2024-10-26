class Job {
  int id;
  String title;
  String description;
  String company;
  DateTime startDate;
  DateTime endDate;
  int wageRange;
  String startHour;
  String endHour;
  int totalNumberOfHours;
  String contactName;
  String location;

  Job({
    required this.id,
    required this.title,
    required this.description,
    required this.company,
    required this.startDate,
    required this.endDate,
    required this.wageRange,
    required this.totalNumberOfHours,
    required this.startHour,
    required this.endHour,
    required this.contactName,
    required this.location,
  });
}

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
      String endHour) {
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
        location: location);
    jobs.add(newJob);
  }

  void updateJob(int id, Map<String, dynamic> updates) {
    Job job = getJob(id);
    job.title = updates['title'] ?? job.title;
    job.description = updates['description'] ?? job.description;
    job.startDate = updates['date'] ?? job.startDate;
    job.wageRange = updates['wageRange'] ?? job.wageRange;
    job.startHour = updates['startHour'] ?? job.startHour;
    job.endHour = updates['endHour'] ?? job.endHour;
    job.totalNumberOfHours = 0; //(job.startDate.difference(job.endDate).inDays * (int.parse(job.endHour) - int.parse(job.startHour))).abs().toInt();
    job.location = updates['location'] ?? job.location;
    job.company = updates['company'] ?? job.company;
    job.contactName = updates['contactName'] ?? job.contactName;
  }

  void deleteJob(int id) {
    jobs.removeWhere((job) => job.id == id);
  }
}
