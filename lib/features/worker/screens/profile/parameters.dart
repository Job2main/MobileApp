// screens/parameters_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:job2main/common/controllers/user_controller.dart';
import 'package:job2main/common/widgets/comfirmation_popup.dart';
import 'package:job2main/common/widgets/snack_bar.dart';
import 'package:job2main/common/models/user.dart';
import 'package:job2main/features/authentication/screens/onboarding/branching.dart';
import 'package:job2main/features/worker/screens/profile/modify_account.dart';
import 'package:job2main/features/worker/screens/profile/widgets/parameter_widgets.dart';
import 'package:job2main/utils/firebase/auth.dart';

class ParametersPage extends StatelessWidget {
  final UserModel user;
  final UserController userController;
  const ParametersPage({super.key, required this.user, required this.userController});

  void yesAction(BuildContext context) {
    Navigator.of(context).pop();
    _logout(context);
  }

  void noAction(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _logout(BuildContext context) {
    userController.logout();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('You have been logged out.')),
    );
    Get.to(() => const BranchingScreen());
  }

  void _showConfirmationDialog(BuildContext context) {
    comfirmationPopUp(
      context,
      'Deconection',
      'Voulez-vous vraiment vous déconnecter?',
      'Oui',
      () => yesAction(context),
      'Non',
      () => noAction(context),
    );
  }

  List<Widget> _accountPart(BuildContext context) {
    return [
      addTitle('Parametres du compte'),
      buildCard(context, [
        buildParameterButton('Compte', pageRedirection: true, () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ModifyAccount(user: user)),
          );
        }),
        buildParameterButton('Confidentialité & Sécurité', () {
          showSnackBar('Button 2 pressed', context);
        }),
      ])
    ];
  }

  List<Widget> _assistancePart(BuildContext context) {
    return [
      addTitle('Assistance'),
      buildCard(context, [
        buildParameterButton('Aide', pageRedirection: true, () {
          showSnackBar('Button Aide pressed', context);
        }),
        buildParameterButton('Nous contacter', pageRedirection: true, () {
          showSnackBar('Button contacter pressed', context);
        }),
      ])
    ];
  }

  Widget _deconectionPart(BuildContext context) {
    return buildCard(context, [
      buildParameterButton(
          'Déconnection',
          myColor: Colors.red,
          () => _showConfirmationDialog(context),
          icon: Icons.logout,
          pageRedirection: false),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parametres'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ..._accountPart(context),
              const SizedBox(height: 20),
              ..._assistancePart(context),
              const SizedBox(height: 20),
              _deconectionPart(context),
            ],
          ),
        ),
      ),
    );
  }
}
