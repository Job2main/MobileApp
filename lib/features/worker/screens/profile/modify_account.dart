import 'package:flutter/material.dart';
import 'package:job2main/features/worker/controllers/user.dart';
import 'package:job2main/features/worker/screens/profile/change_value_page.dart';
import 'package:job2main/features/worker/screens/profile/widgets/parameter_widgets.dart';

class ModifyAccount extends StatelessWidget {
  final User user;
  const ModifyAccount({super.key, required this.user});

  void _redirectFun(BuildContext context, Map<String, dynamic> toUpdates) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChangeValuePage(user: user, toUpdates: toUpdates),
      ),
    );
  }

  Widget buildPButton(BuildContext context, String title, List<dynamic> vars, bool haveTextBefore, bool pageRedirection) {
    String textBefore = '';
    Map<String, dynamic> toUpdates = {};
    if (haveTextBefore) {
      for (var i = 0; i < vars.length; i++) {
        textBefore += vars[i];
        toUpdates[user.getKeyName(vars[i])] = vars[i].runtimeType.toString();
        if (i != vars.length - 1) {
          textBefore += ' ';
        }
      }
    }
    return buildParameterButton(title, textBefore: textBefore, pageRedirection: pageRedirection, () {
      _redirectFun(context, toUpdates);
    });
  }

  List<Widget> _accountInformation(BuildContext context) {
    return [
      addTitle('Information du compte'),
      buildCard(context, [
        buildPButton(context, 'Prenom Nom', [user.name, user.familyName], true, true),
        buildPButton(context, 'Email', [user.email], true, true),
        buildPButton(context, 'Numéro de téléphone', [user.phoneNumber], true, true),
      ])
    ];
  }

  List<Widget> _accountGestion(BuildContext context) {
    return [
      addTitle('Gestion du compte'),
      buildCard(context, [
        buildParameterButton('Changer le mot de passe', pageRedirection: true, () {}),
        buildParameterButton('Supprimer le compte', pageRedirection: false, () {}, myColor: Colors.red),
      ])
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modify Account'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          ..._accountInformation(context),
          const SizedBox(height: 20),
          ..._accountGestion(context),
        ],
      ),
    );
  }
}
