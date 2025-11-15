import 'package:flutter/material.dart';
import 'Dashboard_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(
          0xFFF5F7FA,
        ), // Light grey-blue background
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
          elevation: 2,
          centerTitle: true,
        ),
        // cardTheme removed to stay compatible with current SDK types
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins',
      ),
      home: DashboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
