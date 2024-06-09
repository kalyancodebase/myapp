import 'package:flutter/material.dart';

class Item {
  final String title;

  Item({required this.title});
}

class Playlist extends StatelessWidget {
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
                      textColor: Colors.white,
                      trailing: PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: 'edit',
                    child: Text('Edit'),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: Text('Delete'),
                  )
                ];
              },
              onSelected: (String value){
                  print('You Click on po up menu item');
              },
            ),
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
    home: Playlist(),
  ));
}
