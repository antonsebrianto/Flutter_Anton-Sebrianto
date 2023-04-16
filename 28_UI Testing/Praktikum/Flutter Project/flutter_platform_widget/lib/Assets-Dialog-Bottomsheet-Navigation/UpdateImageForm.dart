import 'package:flutter/material.dart';
import 'package:flutter_platform_widget/Assets-Dialog-Bottomsheet-Navigation/GridviewModel.dart';
import 'package:flutter_platform_widget/Assets-Dialog-Bottomsheet-Navigation/GridviewProvider.dart';
import 'package:provider/provider.dart';

class UpdateImageForm extends StatefulWidget {
  const UpdateImageForm({Key? key}) : super(key: key);

  @override
  State<UpdateImageForm> createState() => _UpdateImageFormState();
}

class _UpdateImageFormState extends State<UpdateImageForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  int? index;

  getData() async {
    final Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    index = int.parse(data['index']);
    GridviewModel gridviewModel =
        Provider.of<GridviewProvider>(context, listen: false).gridView[index!];
    titleController.text = gridviewModel.title;
    imageController.text = gridviewModel.image;
    setState(() {});
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Image"),
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
                  provider.updateImage(
                    index!,
                    GridviewModel(
                        title: titleController.text,
                        image: imageController.text),
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
