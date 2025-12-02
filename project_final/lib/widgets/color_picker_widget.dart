import 'package:flutter/material.dart';

class ColorPickerWidget extends StatelessWidget {
  final Function(Color) onColorSelected;

  ColorPickerWidget({required this.onColorSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () => onColorSelected(Colors.red),
          child: Text("Red"),
        ),
        ElevatedButton(
          onPressed: () => onColorSelected(Colors.blue),
          child: Text("Blue"),
        ),
        ElevatedButton(
          onPressed: () => onColorSelected(Colors.green),
          child: Text("Green"),
        ),
      ],
    );
  }
}
