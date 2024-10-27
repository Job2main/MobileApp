enum JobStatus {
  comfirmed,
  pending,
  refused,
  completed,
  requested,
}

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
  JobStatus status = JobStatus.pending;

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
    required this.status,
  });

  Map<String, dynamic> getAsMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'company': company,
      'startDate': startDate,
      'endDate': endDate,
      'wageRange': wageRange,
      'totalNumberOfHours': totalNumberOfHours,
      'startHour': startHour,
      'endHour': endHour,
      'contactName': contactName,
      'location': location,
      'status': status, 
    };
  }

  void updateJob(Map<String, dynamic> updates) {
    title = updates['title'] ?? title;
    description = updates['description'] ?? description;
    startDate = updates['date'] ?? startDate;
    wageRange = updates['wageRange'] ?? wageRange;
    startHour = updates['startHour'] ?? startHour;
    endHour = updates['endHour'] ?? endHour;
    totalNumberOfHours = 0; //(startDate.difference(endDate).inDays * (int.parse(endHour) - int.parse(startHour))).abs().toInt();
    location = updates['location'] ?? location;
    company = updates['company'] ?? company;
    contactName = updates['contactName'] ?? contactName;
    status = updates['status'] ?? status;
  }

  String getKeyName(dynamic value) {
    Map<String, dynamic> fields = getAsMap();
    String keyName = fields.keys.firstWhere((k) => fields[k] == value, orElse: () => 'Key not found');
    return keyName;
  }

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
