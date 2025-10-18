import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  final List<Map<String, String>> destinations = [
    {"name": "Islamabad", "desc": "The beautiful capital city of Pakistan"},
    {"name": "Lahore", "desc": "The city of gardens and culture"},
    {"name": "Karachi", "desc": "Pakistan’s largest city and business hub"},
    {"name": "Peshawar", "desc": "A historic city known for its traditions"},
    {"name": "Quetta", "desc": "The fruit garden of Pakistan"},
    {"name": "Multan", "desc": "The city of saints and shrines"},
    {
      "name": "Faisalabad",
      "desc": "The Manchester of Pakistan (industrial city)",
    },
    {"name": "Murree", "desc": "A beautiful hill station and tourist spot"},
    {"name": "Skardu", "desc": "Gateway to the world’s highest mountains"},
    {"name": "Hunza", "desc": "Famous for its natural beauty and valleys"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: destinations.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.place, color: Colors.blue),
          title: Text(destinations[index]['name']!),
          subtitle: Text(destinations[index]['desc']!),
        );
      },
    );
  }
}
