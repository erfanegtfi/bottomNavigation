import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  final int item;

  const InfoScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Info Screen of $item')),
      body: Center(child: Text('This is the Info screen')),
    );
  }
}
