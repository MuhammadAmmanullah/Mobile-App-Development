import 'package:flutter/material.dart';
import 'add_activity_screen.dart';
import 'history_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SmartTracker")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Add Activity"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (c) => AddActivityScreen()),
                );
              },
            ),
            ElevatedButton(
              child: Text("View History"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (c) => HistoryScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
