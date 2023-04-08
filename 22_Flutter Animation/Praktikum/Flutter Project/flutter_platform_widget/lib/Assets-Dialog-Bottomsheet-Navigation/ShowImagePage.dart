import 'package:flutter/material.dart';

class ShowImagePage extends StatelessWidget {
  final String imagePath;
  ShowImagePage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image'),
        centerTitle: true,
      ),
      body: Center(
        child: Image.network(imagePath),
      ),
    );
  }
}
