import 'package:flutter/material.dart';
import 'Device_screen_detail.dart';

class Device {
  String name;
  String type;
  String room;
  bool isOn;
  String icon;
  Color color;
  double value;

  Device({
    required this.name,
    required this.type,
    required this.room,
    required this.isOn,
    required this.icon,
    required this.color,
    this.value = 0.5,
  });
}

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Device> devices = [
    Device(
      name: "Living Room Light",
      type: "Light",
      room: "Living Room",
      isOn: false,
      icon: "💡",
      color: Color(0xFFFFD700), // Yellow
    ),
    Device(
      name: "Bedroom Fan",
      type: "Fan",
      room: "Bedroom",
      isOn: true,
      icon: "🌀",
      color: Color(0xFF87CEEB), // Light Blue
    ),
    Device(
      name: "Kitchen AC",
      type: "AC",
      room: "Kitchen",
      isOn: false,
      icon: "❄️",
      color: Color(0xFFADD8E6), // Blue
    ),
    Device(
      name: "Front Camera",
      type: "Camera",
      room: "Entrance",
      isOn: true,
      icon: "📷",
      color: Color(0xFF98FB98), // Light Green
    ),
    Device(
      name: "Smart TV",
      type: "TV",
      room: "Living Room",
      isOn: true,
      icon: "📺",
      color: Color(0xFFFFB6C1), // Light Pink
    ),
    Device(
      name: "Speaker",
      type: "Speaker",
      room: "Bedroom",
      isOn: false,
      icon: "🔊",
      color: Color(0xFFDDA0DD), // Plum
    ),
  ];

  void _toggleDevice(int index) {
    setState(() {
      devices[index].isOn = !devices[index].isOn;
    });
  }

  void _addDevice() {
    String newName = "";
    String newType = "Light";
    String newRoom = "";
    bool newStatus = false;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "➕ Add New Device",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Device Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.devices),
                  ),
                  onChanged: (value) => newName = value,
                ),
                SizedBox(height: 15),
                DropdownButtonFormField<String>(
                  value: newType,
                  decoration: InputDecoration(
                    labelText: "Device Type",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  items: ["Light", "Fan", "AC", "Camera", "TV", "Speaker"].map((
                    String type,
                  ) {
                    return DropdownMenuItem(value: type, child: Text(type));
                  }).toList(),
                  onChanged: (value) => newType = value!,
                ),
                SizedBox(height: 15),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Room Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.room),
                  ),
                  onChanged: (value) => newRoom = value,
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Text("Status: ", style: TextStyle(fontSize: 16)),
                    Switch(
                      value: newStatus,
                      onChanged: (value) {
                        setState(() {
                          newStatus = value;
                        });
                      },
                    ),
                    Text(
                      newStatus ? "ON" : "OFF",
                      style: TextStyle(
                        color: newStatus ? Colors.green : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text("Cancel"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.white,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (newName.isNotEmpty && newRoom.isNotEmpty) {
                          setState(() {
                            devices.add(
                              Device(
                                name: newName,
                                type: newType,
                                room: newRoom,
                                isOn: newStatus,
                                icon: _getIconForType(newType),
                                color: _getColorForType(newType),
                              ),
                            );
                          });
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("✅ Device added successfully!"),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                      },
                      child: Text("Add Device"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _getIconForType(String type) {
    switch (type) {
      case "Light":
        return "💡";
      case "Fan":
        return "🌀";
      case "AC":
        return "❄️";
      case "Camera":
        return "📷";
      case "TV":
        return "📺";
      case "Speaker":
        return "🔊";
      default:
        return "⚙️";
    }
  }

  Color _getColorForType(String type) {
    switch (type) {
      case "Light":
        return Color(0xFFFFD700);
      case "Fan":
        return Color(0xFF87CEEB);
      case "AC":
        return Color(0xFFADD8E6);
      case "Camera":
        return Color(0xFF98FB98);
      case "TV":
        return Color(0xFFFFB6C1);
      case "Speaker":
        return Color(0xFFDDA0DD);
      default:
        return Color(0xFFE6E6FA);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "🏠 Smart Home Dashboard",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        leading: IconButton(icon: Icon(Icons.menu, size: 28), onPressed: () {}),
        actions: [
          IconButton(
            icon: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, color: Colors.white),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Your Smart Devices",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.85,
              ),
              itemCount: devices.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DeviceDetailScreen(device: devices[index]),
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    child: Card(
                      color: devices[index].color.withOpacity(0.1),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: devices[index].color.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                devices[index].icon,
                                style: TextStyle(fontSize: 32),
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              devices[index].name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800],
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                            ),
                            SizedBox(height: 8),
                            Text(
                              devices[index].room,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 8),
                            Switch(
                              value: devices[index].isOn,
                              onChanged: (value) => _toggleDevice(index),
                              activeColor: Colors.green,
                            ),
                            SizedBox(height: 4),
                            Text(
                              devices[index].isOn ? "🟢 ON" : "🔴 OFF",
                              style: TextStyle(
                                color: devices[index].isOn
                                    ? Colors.green
                                    : Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addDevice,
        child: Icon(Icons.add, size: 28),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shape: CircleBorder(),
      ),
    );
  }
}
