import 'package:flutter/material.dart';

class CustomizationBasic extends StatefulWidget {
  final String vehicleType;
  CustomizationBasic({required this.vehicleType});

  @override
  _CustomizationBasicState createState() => _CustomizationBasicState();
}

class _CustomizationBasicState extends State<CustomizationBasic> {
  Color vehicleColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.vehicleType} Customizer (Basic)")),
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
          ],
        ),
      ),
    );
  }
}
