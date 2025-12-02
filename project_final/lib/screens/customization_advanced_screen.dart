import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class CustomizationAdvanced extends StatefulWidget {
  final String vehicleType;
  CustomizationAdvanced({required this.vehicleType});

  @override
  _CustomizationAdvancedState createState() => _CustomizationAdvancedState();
}

class _CustomizationAdvancedState extends State<CustomizationAdvanced> {
  Color vehicleColor = Colors.red;
  bool turboOn = false;
  double enginePower = 50;
  double rideHeight = 50;
  AudioPlayer audioPlayer = AudioPlayer();

  void playTurboSound() async {
    await audioPlayer.play(AssetSource('assets/turbo.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.vehicleType} Customizer (Advanced)"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: vehicleColor,
              child: Center(
                child: Text(
                  widget.vehicleType.toUpperCase(),
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      vehicleColor = Colors.red;
                    });
                  },
                  child: Text("Red"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      vehicleColor = Colors.blue;
                    });
                  },
                  child: Text("Blue"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      vehicleColor = Colors.green;
                    });
                  },
                  child: Text("Green"),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Turbo", style: TextStyle(fontSize: 18)),
                Switch(
                  value: turboOn,
                  onChanged: (val) {
                    setState(() {
                      turboOn = val;
                    });
                    if (val) playTurboSound();
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Engine Power", style: TextStyle(fontSize: 18)),
                Slider(
                  value: enginePower,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  label: enginePower.round().toString(),
                  onChanged: (val) {
                    setState(() {
                      enginePower = val;
                    });
                  },
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Ride Height", style: TextStyle(fontSize: 18)),
                Slider(
                  value: rideHeight,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  label: rideHeight.round().toString(),
                  onChanged: (val) {
                    setState(() {
                      rideHeight = val;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: () {}, child: Text("Rims")),
                ElevatedButton(onPressed: () {}, child: Text("Spoiler")),
                ElevatedButton(onPressed: () {}, child: Text("Decals")),
                ElevatedButton(onPressed: () {}, child: Text("Neon")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
