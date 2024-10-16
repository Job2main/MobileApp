class Job {
  int id;
  String title;
  String description;
  String company;
  DateTime date;
  int wageRange;
  int numberOfHours;
  String location;

  Job({
    required this.id,
    required this.title,
    required this.description,
    required this.company,
    required this.date,
    required this.wageRange,
    required this.numberOfHours,
    required this.location,
  });
}

class JobController {
  List<Job> jobs = [];

  Job getJob(int id) {
    return jobs.firstWhere((job) => job.id == id);
  }

  void createJob(int id, String title, String description, String company, DateTime date, int wageRange, int numberOfHours, String location) {
    Job newJob = Job(id: id, title: title, description: description, company: company, date: date, wageRange: wageRange, numberOfHours: numberOfHours, location: location);
    jobs.add(newJob);
  }

  void updateJob(int id, Map<String, dynamic> updates) {
    Job job = getJob(id);
    job.title = updates['title'] ?? job.title;
    job.description = updates['description'] ?? job.description;
    job.date = updates['date'] ?? job.date;
    job.wageRange = updates['wageRange'] ?? job.wageRange;
    job.numberOfHours = updates['numberOfHours'] ?? job.numberOfHours;
    job.location = updates['location'] ?? job.location;
    job.company = updates['company'] ?? job.company;
  }

  void deleteJob(int id) {
    jobs.removeWhere((job) => job.id == id);
  }
}
