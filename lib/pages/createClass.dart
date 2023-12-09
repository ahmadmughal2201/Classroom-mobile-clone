import 'package:flutter/material.dart';
import 'package:classroom/pages/courseDetail.dart';

class CreateClassScreen extends StatelessWidget {
  final TextEditingController _subjectNameController = TextEditingController();

  CreateClassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context); // Close the current screen
          },
        ),
        title: Text('Create Class'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Subject Name',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            TextField(
              controller: _subjectNameController,
              decoration: InputDecoration(
                hintText: 'Enter Subject Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigate to courseDetail screen with subject name as an argument
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CourseDetailsPage(
                      courseName: _subjectNameController.text,
                      sectionName: 'blah',
                      backgroundImageUrl: 'assets/images/cover1.jpg',
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 20, // Set width to infinity for full width
                child: Center(
                  child: Text(
                    'Create Class',
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
