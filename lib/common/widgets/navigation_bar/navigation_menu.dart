import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job2main/features/worker/screens/myjobs/my_jobs.dart';
import 'package:job2main/features/worker/screens/profile/profile.dart';
import 'package:job2main/utils/helpers/helper_functions.dart';

class WorkerNavigation extends StatelessWidget {
  WorkerNavigation({super.key});

  final Map<String, IconData> bar = const {
    'Home': Iconsax.home,
    'Search': Iconsax.shop,
    'Profile': Iconsax.user,
  };

  final List<Widget> pages = [
    Container(color: Colors.green),
    MyJobsScreen(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return NavigationMenu(bar: bar, pages: pages);
  }
}

class EmployerNavigation extends StatelessWidget {
  EmployerNavigation({super.key});

  final Map<String, IconData> bar = const {
    'Home': Iconsax.home,
    'Search': Iconsax.shop,
    'Profile': Iconsax.user,
  };

  final List<Widget> pages = [
    Container(color: Colors.green),
    //JEREMY: Add your screen here
  ];

  @override
  Widget build(BuildContext context) {
    return NavigationMenu(bar: bar, pages: pages);
  }
}

class NavigationMenu extends StatelessWidget {
  NavigationMenu({super.key, required this.bar, required this.pages});

  final Map<String, IconData> bar;
  final List<Widget> pages;
  final RxInt selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildNavigationBar(context),
      body: Obx(() => pages[selectedIndex.value]),
    );
  }

  Widget _buildNavigationBar(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Obx(
      () => NavigationBar(
        height: 80,
        elevation: 0,
        selectedIndex: selectedIndex.value,
        onDestinationSelected: (index) => selectedIndex.value = index,
        backgroundColor: darkMode ? Colors.black : Colors.white,
        indicatorColor: darkMode
            ? Colors.white.withOpacity(0.1)
            : Colors.black.withOpacity(0.1),
        destinations: bar.entries
            .map(
              (item) => NavigationDestination(
                icon: Icon(item.value),
                selectedIcon: Icon(item.value, color: Colors.blue),
                label: item.key,
              ),
            )
            .toList(),
      ),
    );
  }
}
