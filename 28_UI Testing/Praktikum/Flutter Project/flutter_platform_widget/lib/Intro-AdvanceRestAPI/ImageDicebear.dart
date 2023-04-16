import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageDicebear extends StatefulWidget {
  const ImageDicebear({Key? key}) : super(key: key);

  @override
  State<ImageDicebear> createState() => _ImageDicebearState();
}

class _ImageDicebearState extends State<ImageDicebear> {
  bool flip = false;
  String imageDicebearUrl = '';

  @override
  void initState() {
    fetchImage();
    super.initState();
  }

  fetchImage() async {
    Response response;
    response = await Dio().get(
        'https://api.dicebear.com/6.x/lorelei/svg?flip=${flip}',
        options: Options(validateStatus: (_) => true));
    if (response.statusCode == 200) {
      print(response.data);
      setState(() {
        imageDicebearUrl = response.data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Dicebear'),
      ),
      body: Column(
        children: [
          imageDicebearUrl.isNotEmpty
              ? SvgPicture.string(
                  imageDicebearUrl,
                  height: 100,
                  width: 100,
                )
              : const CircularProgressIndicator(),
          ElevatedButton(
              onPressed: () {
                fetchImage();

                setState(() {
                  flip = !flip;
                });
              },
              child: const Text('Flip'))
        ],
      ),
    );
  }
}
