import 'package:flutter/material.dart';
import 'package:rick_demo_project/core/injection/service_locator.dart';

import 'app.dart';

void main() async{
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Wait for async initialization of service_locator
  await setup();
  // Run app
  runApp(Application());
}


