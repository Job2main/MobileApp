import 'package:flutter/material.dart';
import 'package:job2main/utils/theme/widget_themes/logo_divider.dart';
import 'package:job2main/utils/helpers/others.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  final String profileImageUrl;

  const BuildAppBar({super.key, required this.name, required this.profileImageUrl});

  @override
  Size get preferredSize => const Size.fromHeight(54); // Set the height of the custom AppBar

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: THelperFunctions.isDarkMode(context) ? Colors.black.withOpacity(0.2) : Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  TAnyMode.getLogo(context),
                  width: 35,
                  height: 35,
                ),
                const SizedBox(width: 140),
                Text(
                  'Hello, $name',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 15),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(profileImageUrl),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
