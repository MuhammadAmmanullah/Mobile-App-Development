import 'package:flutter/material.dart';
import 'Dashboard_screen.dart';

class DeviceDetailScreen extends StatefulWidget {
  final Device device;

  const DeviceDetailScreen({Key? key, required this.device}) : super(key: key);

  @override
  _DeviceDetailScreenState createState() => _DeviceDetailScreenState();
}

class _DeviceDetailScreenState extends State<DeviceDetailScreen> {
  late Device device;
  double currentValue = 0.5;

  @override
  void initState() {
    super.initState();
    device = widget.device;
    currentValue = device.value;
  }

  void _updateValue(double value) {
    setState(() {
      currentValue = value;
      device.value = value;
    });
  }

  void _toggleDevice() {
    setState(() {
      device.isOn = !device.isOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Device Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        elevation: 2,
      ),
      body: Container(
        color: Color(0xFFF5F7FA),
        child: Column(
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    device.color.withOpacity(0.3),
                    device.color.withOpacity(0.1),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: device.color.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Text(device.icon, style: TextStyle(fontSize: 60)),
                  ),
                  SizedBox(height: 20),
                  Text(
                    device.name,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "📍 ${device.room}",
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 20),
                  // Status Card
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Current Status:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            children: [
                              Switch(
                                value: device.isOn,
                                onChanged: (value) => _toggleDevice(),
                                activeColor: Colors.green,
                              ),
                              Text(
                                device.isOn ? "🟢 POWER ON" : "🔴 POWER OFF",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: device.isOn
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Controls Section
            if (device.type == "Light" ||
                device.type == "Fan" ||
                device.type == "Speaker")
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            device.type == "Light"
                                ? Icons.lightbulb
                                : device.type == "Fan"
                                ? Icons.ac_unit
                                : Icons.volume_up,
                            size: 40,
                            color: device.color,
                          ),
                          SizedBox(height: 20),
                          Text(
                            device.type == "Light"
                                ? "Brightness Control"
                                : device.type == "Fan"
                                ? "Speed Control"
                                : "Volume Control",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(height: 30),
                          Slider(
                            value: currentValue,
                            onChanged: device.isOn ? _updateValue : null,
                            min: 0,
                            max: 1,
                            divisions: 10,
                            activeColor: device.color,
                            inactiveColor: Colors.grey[300],
                          ),
                          SizedBox(height: 10),
                          Text(
                            "${(currentValue * 100).round()}%",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: device.color,
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: device.color.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              device.isOn
                                  ? "✅ Device is active and responsive"
                                  : "⏸️ Turn on device to adjust settings",
                              style: TextStyle(
                                color: device.isOn ? Colors.green : Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            else
              Expanded(
                child: Center(
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.info_outline,
                            size: 50,
                            color: Colors.blue,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "No Additional Controls",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "This device doesn't have additional\nsettings to configure",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
