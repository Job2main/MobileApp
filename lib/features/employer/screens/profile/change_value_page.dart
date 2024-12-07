import 'package:flutter/material.dart';
import 'package:job2main/common/widgets/comfirmation_popup.dart';
import 'package:job2main/common/models/user.dart';

class ChangeValuePage extends StatefulWidget {
  final User user;
  final Map<String, dynamic> toUpdates;
  const ChangeValuePage({super.key, required this.user, required this.toUpdates});

  @override
  _ChangeValuePageState createState() => _ChangeValuePageState();
}

class _ChangeValuePageState extends State<ChangeValuePage> {
  final Map<String, dynamic> updatedList = {};

  Widget _save(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.save),
      color: Colors.blue,
      onPressed: () {
        _showConfirmationDialog(context);
      },
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    comfirmationPopUp(
      context,
      'Modification',
      'Voulez-vous sauvegarder les modifications?',
      'Oui',
      () {
        setState(() {
          widget.user.updateUserProfile(updatedList);
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        });
      },
      'Non',
      () {
        Navigator.of(context).pop();
      },
    );
  }

  void _update(String key, dynamic value) {
    updatedList[key] = value;
  }

  List<Widget> _createInputs(BuildContext context) {
    List<Widget> inputs = [];
    widget.toUpdates.forEach((key, value) {
      inputs.addAll([
        getGooDWidg(context, key, value),
        const SizedBox(height: 20),
      ]);
    });
    return inputs;
  }

  void _clearKey(String key) {
    updatedList[key] = '';
  }

  Widget textField(String value, String key, Function(String, String) onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black87),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              initialValue: widget.user.getAsMap()[key],
              onChanged: (newValue) {
                onChanged(key, newValue);
              },
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 10.0),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black87),
            onPressed: () {
              _clearKey(key);
            },
          ),
        ],
      ),
    );
  }

  Widget getGooDWidg(BuildContext context, String key, dynamic value) {
    if (value is String) {
      return textField(value, key, _update);
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modifier les informations'),
        centerTitle: true,
        actions: [
          _save(context),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: _createInputs(context),
        ),
      ),
    );
  }
}
