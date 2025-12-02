import 'package:flutter/material.dart';

class VehiclePreviewWidget extends StatelessWidget {
  final Color color;
  final String vehicleType;

  VehiclePreviewWidget({required this.color, required this.vehicleType});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      color: color,
      child: Center(
        child: Text(
          vehicleType.toUpperCase(),
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
