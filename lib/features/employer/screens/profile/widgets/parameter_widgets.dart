import 'package:flutter/material.dart';

Widget buildParameterButton(String label, VoidCallback onPressed, {Color myColor=Colors.black, IconData? icon, bool? pageRedirection, String? textBefore}) {
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
        if (textBefore != null) ...[
          ...List.generate(10, (_) => const Spacer()),
          Text(
            textBefore,
            style: TextStyle(
              color: myColor,
              fontSize: 16,
              fontWeight: FontWeight.normal,
              height: 1.2,
            ),
          ),
        ],
        if (pageRedirection != null && pageRedirection) ...[
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black,),
        ],
      ],
    ),
  );
}

Widget addTitle(String title) {
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

Widget buildCard(BuildContext context, List<Widget> buttons) {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(buttons.length, (index) {
        return Column(
          children: [
            buttons[index],
            if (index < buttons.length - 1) 
              const Divider(height: 20, thickness: 2),
          ],
        );
      }),
      ),
    ),
  );
}