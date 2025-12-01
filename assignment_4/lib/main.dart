import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(SmartTrackerApp());
}

class SmartTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartTracker',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
