import 'package:flutter/material.dart';
import 'package:restaurant_recommendation_app/core/service_locator.dart';

import 'app/app.dart';

/// Entry point of application
void main() async {
  // Ensure all widgets are initialized before running app
  WidgetsFlutterBinding.ensureInitialized();

  // Register service locator instance
  await registerServiceLocator();

  // Start flutter application
  runApp(PopinaApp());
}
