import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_platform_widget/Intro-AdvanceRestAPI/ContactModel.dart';

class ContactAPI extends StatefulWidget {
  const ContactAPI({Key? key}) : super(key: key);

  @override
  State<ContactAPI> createState() => _ContactAPIState();
}

class _ContactAPIState extends State<ContactAPI> {
  ContactModel? contact;
  @override
  void initState() {
    JSONtoObject();
    super.initState();
  }

  JSONtoObject() async {
    Response response;
    response = await Dio().get(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2');
    if (response.statusCode == 200) {
      print(response.data);
      contact = ContactModel.fromJson(response.data);
      setState(() {});
      print(contact!.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      body: Column(
        children: [
          Text('id : ${contact!.id.toString()}'),
          Text('name : ${contact!.name.toString()}'),
          Text('phone : ${contact!.phone.toString()}'),
        ],
      ),
    );
  }
}
