/* --
      LIST OF Enums
      They cannot be created inside a class.
-- */

import 'package:firebase_auth/firebase_auth.dart';

enum PaymentMethods {
  paypal,
  googlePay,
  applePay,
  visa,
  masterCard,
  creditCard,
  paystack,
  razorPay,
  paytm
}

enum UserType {
  none,
  worker,
  employer
}

const Map<UserType, String> userTypeMap = {
  UserType.worker: 'Workers',
  UserType.employer: 'Employers'
};

const Map<String, UserType> userTypeMapReverse = {
  'Workers': UserType.worker,
  'Employers': UserType.employer
};

enum JobStatus {
  comfirmed,
  pending,
  refused,
  completed,
  requested,
}

const Map<JobStatus, String> jobStatusMap = {
  JobStatus.comfirmed: 'Confirmed',
  JobStatus.pending: 'Pending',
  JobStatus.refused: 'Refused',
  JobStatus.completed: 'Completed',
  JobStatus.requested: 'Requested',
};

const Map<String, JobStatus> jobStatusMapReverse = {
  'Confirmed': JobStatus.comfirmed,
  'Pending': JobStatus.pending,
  'Refused': JobStatus.refused,
  'Completed': JobStatus.completed,
  'Requested': JobStatus.requested,
};