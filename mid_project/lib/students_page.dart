import 'package:flutter/material.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({Key? key}) : super(key: key);

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  // ✅ YAHAN AP STUDENT DATA ADD/REMOVE KAR SAKTE HAIN
  List<Map<String, String>> students = [
    {'name': 'Ali Ahmed', 'class': 'Class 10-A', 'rollNo': '001'},
    {'name': 'Sara Khan', 'class': 'Class 9-B', 'rollNo': '002'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Students Data')),

      body: ListView(
        children: [
          Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: students.length,
                itemBuilder: (context, index) {
                  final student = students[index];
                  return Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.blue[100],
                          child: Icon(Icons.person, color: Colors.blue),
                        ),

                        SizedBox(width: 15),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                student['name']!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(student['class']!),
                              Text('Roll No: ${student['rollNo']!}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Students'),
        ],
        currentIndex: 1,
      ),
    );
  }
}
