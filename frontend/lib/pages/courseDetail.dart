import 'package:flutter/material.dart';
import 'package:classroom/components/drawer.dart';
import 'package:classroom/components/workTile.dart';


class CourseDetailsPage extends StatefulWidget {
  final String courseName;
  final String sectionName;
  final String backgroundImageUrl;

  CourseDetailsPage({
    required this.courseName,
    required this.sectionName,
    required this.backgroundImageUrl,
  });

  @override
  _CourseDetailsPageState createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Map<String, dynamic>> dummyWorkData = [
    {
      'title': 'New Assignment',
      'subtitle': 'October 20, 2023',
      'iconData': Icons.assignment,
      'isNewAssignment': true,
    },
    {
      'title': 'New Content',
      'subtitle': 'October 18, 2023',
      'iconData': Icons.video_collection,
      'isNewAssignment': false,
    },
    {
      'title': 'New Assignment',
      'subtitle': 'October 25, 2023',
      'iconData': Icons.assignment,
      'isNewAssignment': true,
    },
    {
      'title': 'New Content',
      'subtitle': 'October 19, 2023',
      'iconData': Icons.video_collection,
      'isNewAssignment': false,
    },
  ];
  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.courseName),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
           _openDrawer();
          },
        ),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: widget.backgroundImageUrl,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(widget.backgroundImageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.courseName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.sectionName,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: dummyWorkData.length,
              itemBuilder: (context, index) {
                return WorkTile(
                  title: dummyWorkData[index]['title'],
                  subtitle: dummyWorkData[index]['subtitle'],
                  isNewAssignment: dummyWorkData[index]['isNewAssignment'],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
