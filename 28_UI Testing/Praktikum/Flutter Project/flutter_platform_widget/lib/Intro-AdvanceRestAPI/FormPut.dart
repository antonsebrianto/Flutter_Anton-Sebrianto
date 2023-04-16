import 'package:flutter/material.dart';
import 'package:flutter_platform_widget/Intro-AdvanceRestAPI/Dio.dart';

class FormPut extends StatefulWidget {
  const FormPut({Key? key}) : super(key: key);

  @override
  State<FormPut> createState() => _FormPut();
}

class _FormPut extends State<FormPut> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Title tidak boleh kosong';
                }
              },
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextFormField(
              controller: bodyController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Body tidak boleh kosong';
                }
              },
              decoration: const InputDecoration(
                labelText: 'Body',
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    DioService().PutRequestDio(
                        1, titleController.text, bodyController.text);
                  }
                },
                child: const Text('Submit')),
          ],
        ),
      ),
    );
  }
}
