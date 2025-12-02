import 'package:flutter/material.dart';

class AccessoryCardWidget extends StatelessWidget {
  final String accessoryName;
  final String assetPath;
  final VoidCallback onTap;

  AccessoryCardWidget({
    required this.accessoryName,
    required this.assetPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          children: [
            Image.asset(assetPath, width: 50, height: 50),
            SizedBox(height: 5),
            Text(accessoryName),
          ],
        ),
      ),
    );
  }
}
