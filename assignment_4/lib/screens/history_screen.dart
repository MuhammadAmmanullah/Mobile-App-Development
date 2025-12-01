import 'package:flutter/material.dart';
import '../providers/activity_provider.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Activity History")),
      body: ActivityProvider.activities.isEmpty
          ? Center(child: Text("No activities yet"))
          : ListView.builder(
              itemCount: ActivityProvider.activities.length,
              itemBuilder: (c, i) {
                final a = ActivityProvider.activities[i];
                return ListTile(
                  title: Text(a.location),
                  subtitle: Text(a.time),
                  trailing: Text(a.imagePath),
                );
              },
            ),
    );
  }
}
