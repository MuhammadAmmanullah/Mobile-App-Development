import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Native Features App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: NativeFeaturesScreen(),
    );
  }
}

class NativeFeaturesScreen extends StatefulWidget {
  @override
  _NativeFeaturesScreenState createState() => _NativeFeaturesScreenState();
}

class _NativeFeaturesScreenState extends State<NativeFeaturesScreen> {
  static const platform = MethodChannel('native.features.channel');

  String _deviceInfo = 'Tap to get device info';
  String _batteryLevel = 'Tap to get battery level';
  String _toastMessage = 'My name is Ali';

  // 1. Get Device Info
  Future<void> _getDeviceInfo() async {
    try {
      final String result = await platform.invokeMethod('getDeviceInfo');
      setState(() {
        _deviceInfo = result;
      });
    } on PlatformException catch (e) {
      setState(() {
        _deviceInfo = "Failed: '${e.message}'";
      });
    }
  }

  // 2. Get Battery Level
  Future<void> _getBatteryLevel() async {
    try {
      final String result = await platform.invokeMethod('getBatteryLevel');
      setState(() {
        _batteryLevel = result;
      });
    } on PlatformException catch (e) {
      setState(() {
        _batteryLevel = "Failed: '${e.message}'";
      });
    }
  }

  // 3. Vibrate Device
  Future<void> _vibrateDevice() async {
    try {
      await platform.invokeMethod('vibrate');
    } on PlatformException catch (e) {
      print("Vibrate failed: '${e.message}'");
    }
  }

  // 4. Show Native Toast
  Future<void> _showNativeToast() async {
    try {
      await platform.invokeMethod('showToast', {'message': _toastMessage});
    } on PlatformException catch (e) {
      print("Toast failed: '${e.message}'");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Native Features')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Device Info Section
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Device Info',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(_deviceInfo, style: TextStyle(fontSize: 14)),
                    SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: _getDeviceInfo,
                      child: Text('Get Device Info'),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            // Battery Level Section
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Battery Level',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(_batteryLevel, style: TextStyle(fontSize: 14)),
                    SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: _getBatteryLevel,
                      child: Text('Get Battery Level'),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            // Vibrate Button
            ElevatedButton(
              onPressed: _vibrateDevice,
              child: Text('Vibrate Device'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
            ),

            SizedBox(height: 16),

            // Toast Section
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Toast Message',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      onChanged: (value) => _toastMessage = value,
                      decoration: InputDecoration(
                        hintText: 'Enter toast message',
                        border: OutlineInputBorder(),
                      ),
                      controller: TextEditingController(text: _toastMessage),
                    ),
                    SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: _showNativeToast,
                      child: Text('Show Native Toast'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
