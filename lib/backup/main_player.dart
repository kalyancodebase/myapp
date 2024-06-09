import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Placeholder for the music player artwork
          Container(
            width: 200,
            height: 200,
            color: Colors.grey, // You can replace this with your artwork or image
          ),
          SizedBox(height: 20), // Add some spacing

          // Music player controls
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.skip_previous),
                onPressed: () {
                  // Handle skip to previous
                },
              ),
              IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () {
                  // Handle play
                },
              ),
              IconButton(
                icon: Icon(Icons.pause),
                onPressed: () {
                  // Handle pause
                },
              ),
              IconButton(
                icon: Icon(Icons.skip_next),
                onPressed: () {
                  // Handle skip to next
                },
              ),
            ],
          ),
          SizedBox(height: 20), // Add some spacing

          // Music player progress and duration
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('0:00'), // Replace with actual elapsed time
              SizedBox(width: 20),
              // You can use a Slider widget to represent progress
              Slider(
                value: 0.5, // Replace with actual progress value
                onChanged: (double value) {
                  // Handle progress change
                },
              ),
              SizedBox(width: 20),
              Text('3:30'), // Replace with actual total duration
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SearchPage(),
  ));
}

