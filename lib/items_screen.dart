import 'package:flutter/material.dart';
import 'package:flutter_application_1/details_screen.dart';

class ItemsScreen extends StatelessWidget {
  final int index;

  const ItemsScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tab $index - List')),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (_, i) {
          return ListTile(
            title: Text('Item $i'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => DetailScreen(item: i)),
              );
            },
          );
        },
      ),
    );
  }
}
