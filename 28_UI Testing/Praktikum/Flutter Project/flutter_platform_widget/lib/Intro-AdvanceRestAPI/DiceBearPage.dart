import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiceBearPage extends StatefulWidget {
  const DiceBearPage({Key? key}) : super(key: key);

  @override
  State<DiceBearPage> createState() => _DiceBearPageState();
}

class _DiceBearPageState extends State<DiceBearPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController styleNameController = TextEditingController();
  String _diceBearImageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Generator'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // const DiceBear(),
          _diceBearImageUrl.isNotEmpty
              ? SvgPicture.string(
                  _diceBearImageUrl,
                  height: 100,
                  width: 100,
                )
              : const CircularProgressIndicator(),
          Form(
            key: _formKey,
            child: TextFormField(
              controller: styleNameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Name harus di isi';
                }
              },
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                Response response;
                response = await Dio().get(
                    'https://api.dicebear.com/6.x/${styleNameController.text}/svg',
                    options: Options(validateStatus: (_) => true));
                if (response.statusCode == 200) {
                  setState(() {
                    _diceBearImageUrl = response.data;
                  });
                  print(_diceBearImageUrl.toString());
                }
              }
            },
            child: const Text('GENERATE'),
          ),
        ],
      ),
    );
  }
}
