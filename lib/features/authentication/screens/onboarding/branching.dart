import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job2main/common/controllers/user_controller.dart';
import 'package:job2main/common/models/user.dart';
import 'package:job2main/common/widgets/navigation_bar/navigation_menu.dart';
import 'package:job2main/features/authentication/controllers/usertype_controller.dart';
import 'package:job2main/features/authentication/screens/common/header.dart';
import 'package:job2main/features/authentication/screens/login/login.dart';
import 'package:job2main/utils/constants/colors.dart';
import 'package:job2main/utils/constants/enums.dart';
import 'package:job2main/utils/constants/sizes.dart';
import 'package:job2main/utils/constants/text_strings.dart';
import 'package:job2main/utils/firebase/auth.dart';
import 'package:provider/provider.dart';

class BranchingScreen extends StatelessWidget {
  const BranchingScreen({super.key});

  Widget _buildButton(
      BuildContext context, String text, Color color, UserType userType) {
    return SizedBox(
      width: Get.width * 0.4,
      child: ElevatedButton(
          onPressed: () {
            final UserTypeController userTypeController = Get.put(UserTypeController());
            userTypeController.setUserType(userType);
            Get.to(() => const LoginScreen());
          },
          style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                backgroundColor: WidgetStateProperty.all<Color>(color),
              ),
          child: Text(text)),
    );
  }

  Widget buildBranchingScreen(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const THeader(
                title: TTexts.onBoardingChoiceTitle, subtitle: TTexts.onBoardingChoiceSubTitle),
            const SizedBox(height: TSizes.spaceBtwSections),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton(
                    context, TTexts.onBoardingEmployer, TColors.custom3, UserType.employer),
                _buildButton(context, TTexts.onBoardingWorker, TColors.custom4, UserType.worker),
              ],
            )
          ],
        ),
      ),
    );
  }

  // TODO: ADD ERROR HANDLING IN CASE UserType IS NONE
  Future<void> redirectGoodUserType(UserController userController) async {
    final Auth auth = Auth();
    final User? user = auth.currentUser;
    final UserTypeController userTypeController = Get.put(UserTypeController());
    if (user != null) {
      final UserModel? userModel = await userController.fetchUserModel();
      final UserType userType = userModel?.userType ?? UserType.none;
      userTypeController.setUserType(userType);
      Get.to(() => userType == UserType.employer ? EmployerNavigation() : WorkerNavigation());
    }
  }

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();

    if (userController.currentUser != null) {
      redirectGoodUserType(userController);
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return buildBranchingScreen(context);
    }
  }
}
