import 'package:flutter/material.dart';
import 'package:job2main/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:job2main/common/controllers/user_controller.dart';
import 'package:job2main/firebase_options.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase with platform-specific options
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  // Run the app wrapped with the ChangeNotifierProvider to provide the UserController
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserController(),  // Create and provide the UserController
      child: const App(),
    ),
  );
}
