import 'package:flutter/material.dart';
import 'package:flutter_application_1/info_screen.dart';

class DetailScreen extends StatelessWidget {
  final int item;

  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail $item')),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to Info Screen', style: TextStyle(color: Colors.white)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => InfoScreen(item: item)),
            );
          },
        ),
      ),
    );
  }
}
