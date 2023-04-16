import 'package:flutter/material.dart';
import 'package:flutter_platform_widget/Assets-Dialog-Bottomsheet-Navigation/GridviewModel.dart';
import 'package:flutter_platform_widget/Assets-Dialog-Bottomsheet-Navigation/GridviewProvider.dart';
import 'package:provider/provider.dart';

class AddImageForm extends StatefulWidget {
  const AddImageForm({Key? key}) : super(key: key);

  @override
  State<AddImageForm> createState() => _AddImageFormState();
}

class _AddImageFormState extends State<AddImageForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Image"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Title",
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter title';
                }
                return null;
              },
            ),
            TextFormField(
              controller: imageController,
              decoration: const InputDecoration(
                labelText: "Image Url",
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter image url';
                }
                return null;
              },
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final provider =
                      Provider.of<GridviewProvider>(context, listen: false);
                  provider.addImage(
                    GridviewModel(
                      title: titleController.text,
                      image: imageController.text,
                    ),
                  );
                  Navigator.pop(context);
                }
              },
              child: const Text('submit'),
            ),
          ],
        ),
      ),
    );
  }
}
