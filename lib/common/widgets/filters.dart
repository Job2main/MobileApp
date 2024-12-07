import 'package:flutter/material.dart';

Widget buildFilter(Function() onPressed) {
    return IconButton(
      icon: const Icon(Icons.add, color: Colors.blue),
      onPressed: () => onPressed(),
    );
  }

Widget buildFilterBox(Map<Object, Object> filters, Function(Object) onDeleted) {
  return Row(
    children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Wrap(
            spacing: 8.0,
            children: filters.entries.map((entry) {
              return Chip(
                label: Text("${entry.key.toString().split('.').last}: ${entry.value}"),
                onDeleted: () => onDeleted(entry.key),
              );
            }).toList(),
          ),
        ),
      ),
    ],
  );
}

void showFilterDialog(BuildContext context, Object status, Function(String) onPressed) {
  TextEditingController inputController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Set Filter for ${status.toString().split('.').last}"),
        content: TextField(
          controller: inputController,
          decoration: const InputDecoration(labelText: 'Enter filter criteria'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Close"),
          ),
          TextButton(
            onPressed: () {
              onPressed(inputController.text);
              Navigator.of(context).pop();
            },
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}