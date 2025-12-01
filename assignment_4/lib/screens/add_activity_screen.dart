import 'package:flutter/material.dart';
import '../providers/activity_provider.dart';
import '../model/activity_model.dart';

class AddActivityScreen extends StatefulWidget {
  @override
  State<AddActivityScreen> createState() => _AddActivityScreenState();
}

class _AddActivityScreenState extends State<AddActivityScreen> {
  String? location = "Sample Location";
  String? imagePath = "Sample Image Path";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Activity")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Location: ${location ?? 'No location'}"),
            SizedBox(height: 20),
            Text("Image: ${imagePath ?? 'No image'}"),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Save Activity"),
              onPressed: () {
                ActivityProvider.addActivity(
                  ActivityModel(
                    imagePath: imagePath ?? "",
                    location: location ?? "",
                    time: DateTime.now().toString(),
                  ),
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
