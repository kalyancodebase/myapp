import 'package:flutter/material.dart';

class Item {
  final String title;

  Item({required this.title});
}

class ProfilePage extends StatelessWidget {
  final List<Item> items = [
    Item(title: 'Song 1'),
    Item(title: 'Song 2'),
    Item(title: 'Song 3'),
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // List with buttons and icons after each item
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(items[index].title),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.play_arrow),
                          onPressed: () {
                            // Handle play
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            // Handle remove
                          },
                        ),
                      ],
                    ),
                    Divider(
                      height: 1.0,
                      color: Colors.grey,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
  ));
}
