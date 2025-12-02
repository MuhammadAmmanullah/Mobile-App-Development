import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class TurboSwitchWidget extends StatefulWidget {
  final Function(bool) onChanged;

  TurboSwitchWidget({required this.onChanged});

  @override
  _TurboSwitchWidgetState createState() => _TurboSwitchWidgetState();
}

class _TurboSwitchWidgetState extends State<TurboSwitchWidget> {
  bool turboOn = false;
  AudioPlayer audioPlayer = AudioPlayer();

  void playTurboSound() async {
    await audioPlayer.play(AssetSource('assets/turbo.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Turbo", style: TextStyle(fontSize: 18)),
        Switch(
          value: turboOn,
          onChanged: (val) {
            setState(() {
              turboOn = val;
              widget.onChanged(val);
              if (val) playTurboSound();
            });
          },
        ),
      ],
    );
  }
}
