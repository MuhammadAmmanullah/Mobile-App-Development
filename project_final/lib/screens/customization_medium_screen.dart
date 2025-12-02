import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class CustomizationMedium extends StatefulWidget {
  final String vehicleType;
  CustomizationMedium({required this.vehicleType});

  @override
  _CustomizationMediumState createState() => _CustomizationMediumState();
}

class _CustomizationMediumState extends State<CustomizationMedium> {
  Color vehicleColor = Colors.red;
  bool turboOn = false;
  AudioPlayer audioPlayer = AudioPlayer();

  void playTurboSound() async {
    await audioPlayer.play(AssetSource('assets/turbo.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.vehicleType} Customizer (Medium)")),
      body: Padding(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: () {}, child: Text("Rims")),
                ElevatedButton(onPressed: () {}, child: Text("Spoiler")),
                ElevatedButton(onPressed: () {}, child: Text("Decals")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
