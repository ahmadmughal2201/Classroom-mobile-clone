import 'package:flutter/material.dart';
import 'package:classroom/components/courseCard.dart';
import 'package:classroom/components/drawer.dart';
import 'package:classroom/components/bottomModal.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Classroom Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, String>> courseData = [
    {
      'backgroundImage': 'assets/images/cover1.jpg',
      'courseTitle': 'Mathematics',
      'sectionName': 'A',
      'teacherName': 'John Doe',
    },
    {
      'backgroundImage': 'assets/images/cover3.jpg',
      'courseTitle': 'History',
      'sectionName': 'B',
      'teacherName': 'Jane Smith',
    },
    {
      'backgroundImage': 'assets/images/cover4.jpg',
      'courseTitle': 'Physics',
      'sectionName': 'C',
      'teacherName': 'Alex Johnson',
    },
    // Add more data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          title: Text('Classroom'),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("assets/images/dp.png"),
              ),
            ),
          ],
        ),
        drawer: MyDrawer(),
        body: Center(
          child: ListView.builder(
            itemCount: courseData.length,
            itemBuilder: (context, index) {
              return CourseCard(
                backgroundImage: courseData[index]['backgroundImage']!,
                courseTitle: courseData[index]['courseTitle']!,
                sectionName: courseData[index]['sectionName']!,
                teacherName: courseData[index]['teacherName']!,
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Show the bottom sheet when the button is pressed
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return ClassOptionsBottomSheet();
              },
            );          },
          tooltip: 'Add',
          backgroundColor: Colors.white,
          // Set background color to white
          foregroundColor: Colors.blue,
          // Set icon color to blue
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
