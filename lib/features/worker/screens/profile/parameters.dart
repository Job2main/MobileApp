// screens/parameters_page.dart
import 'package:flutter/material.dart';
import 'package:job2main/common/widgets/comfirmation_popup.dart';
import 'package:job2main/common/widgets/snack_bar.dart';

class ParametersPage extends StatelessWidget {
  const ParametersPage({super.key});

  void yesAction(BuildContext context) {
    Navigator.of(context).pop();
    _logout(context);
  }

  void noAction(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _logout(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('You have been logged out.')),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    comfirmationPopUp(
      context,
      'Deconection',
      'Are you sure you want to log out?',
      'Yes',
      () => yesAction(context),
      'No',
      () => noAction(context),
    );
  }

  Widget _buildCard(BuildContext context, List<Widget> buttons) {
    return Card(
      elevation: 4, // Shadow elevation
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(buttons.length, (index) {
          return Column(
            children: [
              buttons[index],
              // Add a divider if this is not the last button
              if (index < buttons.length - 1) 
                const Divider(height: 20, thickness: 2),
            ],
          );
        }),
        ),
      ),
    );
  }

  Widget _buildButton(String label, VoidCallback onPressed, {Color myColor=Colors.black, IconData? icon, bool? pageRedirection}) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      minimumSize: Size.zero,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, size: 18, color: Colors.black,),
            const SizedBox(width: 8),
          ],
          Text(
            label,
            style: TextStyle(
              color: myColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
          if (pageRedirection != null && pageRedirection) ...[
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black,),
          ],
        ],
      ),
    );
  }

  Widget _addTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
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
              _addTitle('Parametres du compte'),
              _buildCard(context, [
                _buildButton('Compte', pageRedirection: true, () {
                  showSnackBar('Button Compte pressed', context);
                }),
                _buildButton('Confidentialité & Sécurité', () {
                  showSnackBar('Button 2 pressed', context);
                }),
              ]),
              const SizedBox(height: 20),
              _addTitle('Assistance'),
              _buildCard(context, [
                _buildButton('Aide', pageRedirection: true, () {
                  showSnackBar('Button Aide pressed', context);
                }),
                _buildButton('Nous contacter', pageRedirection: true, () {
                  showSnackBar('Button contacter pressed', context);
                }),
              ]),
              const SizedBox(height: 20),
              _buildCard(context, [
                _buildButton("Déconnection", myColor: Colors.red,
                () => _showConfirmationDialog(context),
                icon: Icons.logout, pageRedirection: false),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
