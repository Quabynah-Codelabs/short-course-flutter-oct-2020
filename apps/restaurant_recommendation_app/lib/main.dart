import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_recommendation_app/app/app.dart';

/// ASSIGNMENT:
/// 1. Create an onboarding page
/// 2. Use PageView to create an onboarding screen of 3 pages
/// 3. on each page show an image from your asset & a short text describing one functionality of this application

/// This line of command is used to generate code in dart using the build_runner package
/// flutter packages pub run build_runner build --delete-conflicting-outputs
// Entry point of the application
void main() async {
  // ensures that flutter is running on the target device
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase initialization
  await Firebase.initializeApp();

  runApp(PopinaApp());
}
