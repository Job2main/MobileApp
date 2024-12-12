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