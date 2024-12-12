import 'package:firebase_auth/firebase_auth.dart';
import 'package:job2main/common/widgets/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job2main/features/authentication/controllers/usertype_controller.dart';
import 'package:job2main/features/authentication/screens/signup/verify_email.dart';
import 'package:job2main/features/authentication/screens/signup/widgets/term_and_condition_checkbox.dart';
import 'package:job2main/utils/constants/enums.dart';
import 'package:job2main/utils/constants/sizes.dart';
import 'package:job2main/utils/constants/text_strings.dart';
import 'package:job2main/utils/firebase/auth.dart';

class SignupForm extends StatelessWidget {
  SignupForm({
    super.key,
  });

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _userName = TextEditingController();

  Map<String, dynamic> getData() => {
    'email': _email.text,
    'password': _password.text,
    'firstName': _firstName.text,
    'lastName': _lastName.text,
    'userName': _userName.text,
    'phoneNumber': _phoneNumber.text,
    'createdAt': DateTime.now(),
  };

  Future<void> createUserWithEmailAndPassword(UserTypeController userTypeController) async {
    try {
      if (_email.text.isEmpty ||
          _password.text.isEmpty ||
          _firstName.text.isEmpty ||
          _lastName.text.isEmpty ||
          _phoneNumber.text.isEmpty ||
          _userName.text.isEmpty) {
        Get.snackbar(TTexts.error, TTexts.allFieldsRequired);
        return;
      }

      final auth = Auth();
      final User? userCredential = await auth.createUserWithEmailAndPassword(email: _email.text, password: _password.text);
      Map<String, dynamic> userData = getData();

      userData['uid'] = userCredential!.uid;
      userData['userType'] = userTypeController.getUserTypeString();

      await auth.createUser(userTypeController.getUserType(), userCredential.uid, userData);
      Get.to(() => VerifyEmailScreen(email: _email.text));
    } on FirebaseAuthException catch (e) {
      printError(info: e.toString());
      Get.snackbar(TTexts.error, e.message!);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final UserTypeController userTypeController = Get.find<UserTypeController>();
    
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: getFormField(_firstName, TTexts.firstName, Iconsax.user),
              ),
              const SizedBox(width: TSizes.spaceBtwInputFields),
              Expanded(
                child: getFormField(_lastName, TTexts.lastName, Iconsax.user),
              )
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          getFormField(_userName, TTexts.username, Iconsax.user),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          getFormField(_email, TTexts.email, Iconsax.direct),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          getFormField(_phoneNumber, TTexts.phoneNo, Iconsax.call),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          getFormField(_password, TTexts.password, Iconsax.password_check,
              suffixIcon: Iconsax.eye_slash),
          const SizedBox(height: TSizes.spaceBtwSections),
          const TermAndConditionCheckbox(),
          const SizedBox(height: TSizes.spaceBtwSections),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => createUserWithEmailAndPassword(userTypeController),
                  child: const Text(TTexts.createAccount))),
        ],
      ),
    );
  }
}
