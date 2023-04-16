import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ShowImagePage extends StatelessWidget {
  // const ShowImagePage({Key? key}) : super(key: key);

  final String nameProduct;
  final String imageProduct;
  ShowImagePage({required this.nameProduct, required this.imageProduct});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product ${nameProduct}'),
        centerTitle: true,
      ),
      body: Center(
        child: Image.asset(imageProduct),
      ),
    );
  }
}
