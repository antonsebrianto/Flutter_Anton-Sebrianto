import 'package:flutter/material.dart';
import 'package:flutter_platform_widget/Intro-AdvanceRestAPI/Dio.dart';

class FormContactsAPI extends StatefulWidget {
  const FormContactsAPI({Key? key}) : super(key: key);

  @override
  State<FormContactsAPI> createState() => _FormContactsAPI();
}

class _FormContactsAPI extends State<FormContactsAPI> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

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
              controller: idController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'ID tidak boleh kosong';
                }
              },
              decoration: const InputDecoration(
                labelText: 'ID',
              ),
            ),
            TextFormField(
              controller: nameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Name tidak boleh kosong';
                }
              },
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextFormField(
              controller: phoneController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Phone tidak boleh kosong';
                }
              },
              decoration: const InputDecoration(
                labelText: 'Phone',
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    DioService().PostContacts(idController.text,
                        nameController.text, phoneController.text);
                  }
                },
                child: const Text('Submit')),
          ],
        ),
      ),
    );
  }
}
