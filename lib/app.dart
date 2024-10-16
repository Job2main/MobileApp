import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job2main/features/authentication/screens/onboarding/onboarding.dart';
import 'package:job2main/utils/theme/theme.dart';
import 'package:job2main/features/worker/screens/profile/profile.dart';
import 'package:job2main/features/worker/screens/myjobs/myjobs.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: ProfileScreen(),
    );
  }
}
