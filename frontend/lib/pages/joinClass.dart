import 'package:flutter/material.dart';

class JoinClassScreen extends StatelessWidget {
  const JoinClassScreen({Key? key}) : super(key: key);

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
        title: Text('Join Class'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 25,
                // Add the circular profile picture here
                backgroundImage: AssetImage("assets/images/dp.png"),
              ),
              title: Text('User Name'),
              subtitle: Text('user@gmail.com'),
            ),
            Divider(),
            SizedBox(height: 10),
            Text(
              'Ask your teacher for the class code and enter it below.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter Class Code',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {

                // Add your Join class logic here

              },
              child: Container(
                width: double.infinity,
                height: 20, // Set width to infinity for full width
                child: Center(
                  child: Text(
                    'Join Class',
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
