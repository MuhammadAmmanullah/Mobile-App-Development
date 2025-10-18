import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController destinationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Travel Image
          Image.network(
            'https://cdn.pixabay.com/photo/2015/03/26/09/54/globe-690443_960_720.jpg',
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          // Welcome Message
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.lightBlue.shade50,
            child: Text(
              "Welcome to Travel Guide App! Find your dream destination easily.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),

          // RichText slogan
          Padding(
            padding: const EdgeInsets.all(10),
            child: RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 20, color: Colors.black),
                children: [
                  TextSpan(text: "Explore "),
                  TextSpan(
                    text: "the World ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  TextSpan(text: "with Us!"),
                ],
              ),
            ),
          ),

          // TextField
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: destinationController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Destination Name",
              ),
            ),
          ),

          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: Text("Search"),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Searching for destination...")),
                  );
                },
              ),
              TextButton(
                child: Text("Clear"),
                onPressed: () {
                  destinationController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Destination cleared.")),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
