import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job2main/features/authentication/screens/login/login.dart';
import 'package:job2main/utils/constants/sizes.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    const Text('Reset Password'),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'New Password',
                        hintText: 'Enter your new password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
                        ),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        hintText: 'Confirm your new password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
                        ),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          () => Get.to(() => const LoginScreen());
                        },
                        child: const Text('Reset Password'),
                      ),
                    ),
                  ],
                ))));
  }
}
