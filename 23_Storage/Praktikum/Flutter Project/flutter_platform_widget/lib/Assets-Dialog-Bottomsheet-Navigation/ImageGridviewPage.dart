import 'package:flutter/material.dart';
import 'package:flutter_platform_widget/Assets-Dialog-Bottomsheet-Navigation/GridviewModel.dart';
import 'package:flutter_platform_widget/Assets-Dialog-Bottomsheet-Navigation/ShowImagePage.dart';

class ImageGridviewPage extends StatelessWidget {
  const ImageGridviewPage({Key? key}) : super(key: key);

  void showImage(BuildContext context, String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ShowImagePage(imagePath: imagePath)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Galeri'),
        ),
        body: GridView.builder(
          itemCount: gridviewList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        margin: const EdgeInsets.only(top: 10),
                        height: 500,
                        child: Column(
                          children: [
                            const Center(
                              child: Text('Tampilkan Gambar ?'),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                                height: 300,
                                child: Image.network(
                                  gridviewList[index].image,
                                  fit: BoxFit.cover,
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    showImage(
                                        context, gridviewList[index].image);
                                  },
                                  child: const Text('Ya'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Tidak'),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 154,
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        // height: 200,
                        decoration: const BoxDecoration(
                          // color: bgColor,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: SizedBox(
                          width: 140,
                          height: 140,
                          child: Image.network(
                            gridviewList[index].image,
                            // height: 132,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                gridviewList[index].title,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
