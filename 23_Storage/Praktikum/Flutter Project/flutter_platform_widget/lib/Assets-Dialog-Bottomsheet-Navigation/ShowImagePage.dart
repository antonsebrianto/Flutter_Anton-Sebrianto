import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ShowImagePage extends StatelessWidget {
  // const ShowImagePage({Key? key}) : super(key: key);

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
