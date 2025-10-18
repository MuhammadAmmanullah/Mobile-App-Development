import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  final List<Map<String, String>> landmarks = [
    {
      "image":
          "https://cdn.pixabay.com/photo/2015/11/07/11/15/eiffel-tower-1034175_960_720.jpg",
      "title": "Eiffel Tower",
    },
    {
      "image":
          "https://cdn.pixabay.com/photo/2016/11/29/12/54/mount-fuji-1868203_960_720.jpg",
      "title": "Mount Fuji",
    },
    {
      "image":
          "https://cdn.pixabay.com/photo/2015/03/26/09/39/statue-of-liberty-690237_960_720.jpg",
      "title": "Statue of Liberty",
    },
    {
      "image":
          "https://cdn.pixabay.com/photo/2014/05/03/00/40/taj-mahal-336395_960_720.jpg",
      "title": "Taj Mahal",
    },
    {
      "image":
          "https://cdn.pixabay.com/photo/2019/03/03/12/01/pyramids-4035857_960_720.jpg",
      "title": "Pyramids of Giza",
    },
    {
      "image":
          "https://cdn.pixabay.com/photo/2015/12/01/20/28/china-1074609_960_720.jpg",
      "title": "Great Wall of China",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      itemCount: landmarks.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          child: Column(
            children: [
              Image.network(
                landmarks[index]['image']!,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 5),
              Text(
                landmarks[index]['title']!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      },
    );
  }
}
