import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job2main/common/controllers/user_controller.dart';
import 'package:job2main/common/widgets/navigation_bar/navigation_menu.dart';
import 'package:job2main/features/authentication/controllers/usertype_controller.dart';
import 'package:job2main/features/authentication/screens/common/header.dart';
import 'package:job2main/features/authentication/screens/login/login.dart';
import 'package:job2main/utils/constants/colors.dart';
import 'package:job2main/utils/constants/enums.dart';
import 'package:job2main/utils/constants/sizes.dart';
import 'package:job2main/utils/constants/text_strings.dart';
import 'package:provider/provider.dart';

class BranchingScreen extends StatelessWidget {
  const BranchingScreen({super.key});

  Widget _buildButton(
      BuildContext context, String text, Color color, UserType userType, bool isLogin) {
    return SizedBox(
      width: Get.width * 0.4,
      child: ElevatedButton(
          onPressed: () {
            final UserTypeController userTypeController = Get.put(UserTypeController());
            userTypeController.setUserType(userType);
            if (isLogin) {
              Get.to(() => userTypeController.userType.value == UserType.employer
                  ? EmployerNavigation()
                  : WorkerNavigation());
            } else {
              Get.to(() => const LoginScreen());
            }
          },
          style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                backgroundColor: WidgetStateProperty.all<Color>(color),
              ),
          child: Text(text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context);
    final bool isLogin = userController.currentUser != null;

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
                _buildButton(context, TTexts.onBoardingEmployer, TColors.custom3, UserType.employer,
                    isLogin),
                _buildButton(
                    context, TTexts.onBoardingWorker, TColors.custom4, UserType.worker, isLogin),
              ],
            )
          ],
        ),
      ),
    );
  }
}
