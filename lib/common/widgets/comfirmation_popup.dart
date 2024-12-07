import 'package:flutter/material.dart';

void comfirmationPopUp(BuildContext context, String title, String msg, String yes, VoidCallback yesAction, String no, VoidCallback noAction) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(msg),
        actions: [
          TextButton(
            onPressed: noAction,
            child: Text(no),
          ),
          TextButton(
            onPressed: yesAction,
            child: Text(yes, style: const TextStyle(color: Colors.red),),
          ),
        ],
      );
    },
  );
}