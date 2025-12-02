import 'package:flutter/material.dart';
import 'customization_basic.dart';
import 'customization_medium.dart';
import 'customization_advanced.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Vehicle & Version")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Choose Vehicle", style: TextStyle(fontSize: 22)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CustomizationBasic(vehicleType: 'Car'),
                      ),
                    );
                  },
                  child: Text("Car"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CustomizationBasic(vehicleType: 'Bike'),
                      ),
                    );
                  },
                  child: Text("Bike"),
                ),
              ],
            ),
            SizedBox(height: 40),
            Text("Choose Version", style: TextStyle(fontSize: 22)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CustomizationBasic(vehicleType: 'Car'),
                      ),
                    );
                  },
                  child: Text("Basic"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CustomizationMedium(vehicleType: 'Car'),
                      ),
                    );
                  },
                  child: Text("Medium"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            CustomizationAdvanced(vehicleType: 'Car'),
                      ),
                    );
                  },
                  child: Text("Advanced"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
