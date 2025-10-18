import 'package:flutter/material.dart';

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _usernameController = TextEditingController();
  String _username = "Amman Ullah";
  String _errorText = "";

  @override
  Widget build(BuildContext context) {
    // Get screen orientation
    var orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Screen"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Picture
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blueAccent.withOpacity(0.1),
                child: Icon(Icons.person, size: 70, color: Colors.blueAccent),
              ),

              SizedBox(height: 16),

              // Name and Email
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "$_username\n",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: "amman@example.com",
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Row with two buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Followed $_username")),
                      );
                    },
                    child: Text("Follow"),
                  ),
                  SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("Message sent")));
                    },
                    child: Text("Message"),
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Container for description
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Hi! I'm Amman, a Flutter learner who loves building mobile apps.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),

              SizedBox(height: 20),

              // TextField to update username
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: "Enter new username",
                  border: OutlineInputBorder(),
                  errorText: _errorText.isEmpty ? null : _errorText,
                ),
              ),
              SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_usernameController.text.isEmpty) {
                      _errorText = "Username cannot be empty";
                    } else {
                      _errorText = "";
                      _username = _usernameController.text;
                    }
                  });
                },
                child: Text("Update Name"),
              ),

              SizedBox(height: 30),

              // Show Orientation
              Text(
                "Current Orientation: ${orientation == Orientation.portrait ? "Portrait" : "Landscape"}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
