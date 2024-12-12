import 'package:flutter/material.dart';
import 'package:job2main/common/controllers/user_controller.dart';
import 'package:job2main/common/models/user.dart';
import 'package:job2main/features/worker/screens/profile/change_value_page.dart';
import 'package:job2main/features/worker/screens/profile/widgets/parameter_widgets.dart';

class ModifyAccount extends StatefulWidget {
  final UserController userController;
  late UserModel user;
  ModifyAccount({super.key, required this.userController});

  @override
  _ModifyAccountState createState() => _ModifyAccountState();
}

class _ModifyAccountState extends State<ModifyAccount> {
  void _redirectFun(BuildContext context, Map<String, dynamic> toUpdates) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ChangeValuePage(user: widget.user, toUpdates: toUpdates, userController: widget.userController),
      ),
    );
  }

  @override
   void didChangeDependencies() {
    super.didChangeDependencies();
    widget.user = widget.userController.getUserModel()!;
  }

  Widget buildPButton(BuildContext context, String title, List<dynamic> vars, bool haveTextBefore, bool pageRedirection) {
    String textBefore = '';
    Map<String, dynamic> toUpdates = {};
    if (haveTextBefore) {
      for (var i = 0; i < vars.length; i++) {
        textBefore += vars[i];
        // TODO: to FIX creat a bug when key have same value
        toUpdates[widget.user.getKeyName(vars[i])] = vars[i].runtimeType.toString();
        if (i != vars.length - 1) {
          textBefore += ' ';
        }
      }
    }
    return buildParameterButton(title, textBefore: textBefore, pageRedirection: pageRedirection,
        () {
      _redirectFun(context, toUpdates);
    });
  }

  List<Widget> _accountInformation(BuildContext context) {
    return [
      addTitle('Information du compte'),
      buildCard(context, [
        buildPButton(context, 'Prenom Nom', [widget.user.firstName, widget.user.lastName], true, true),
        buildPButton(context, 'Email', [widget.user.email], true, true),
        buildPButton(context, 'Numéro de téléphone', [widget.user.phoneNumber], true, true),
      ])
    ];
  }

  List<Widget> _accountGestion(BuildContext context) {
    return [
      addTitle('Gestion du compte'),
      buildCard(context, [
        buildParameterButton('Changer le mot de passe', pageRedirection: true, () {}),
        buildParameterButton(
            'Supprimer le compte', pageRedirection: false, () {}, myColor: Colors.red),
      ])
    ];
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
              ..._accountInformation(context),
              const SizedBox(height: 20),
              ..._accountGestion(context),
            ],
          ),
        ),
      ),
    );
  }
}
