import 'package:flutter/material.dart';
import 'package:flutter_platform_widget/Assets-Dialog-Bottomsheet-Navigation/GridviewModel.dart';
import 'package:flutter_platform_widget/Assets-Dialog-Bottomsheet-Navigation/GridviewProvider.dart';
import 'package:flutter_platform_widget/Assets-Dialog-Bottomsheet-Navigation/ShowImagePage.dart';
import 'package:provider/provider.dart';

class ImageGridview extends StatelessWidget {
  void showImage(BuildContext context, String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ShowImagePage(imagePath: imagePath)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GridviewProvider>(
      builder: (context, GridviewProvider, child) {
        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              GridviewModel gridviewModel = GridviewProvider.gridView[index];
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
                                    GridviewProvider.gridView[index].image,
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
                                          context,
                                          GridviewProvider
                                              .gridView[index].image);
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
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.white,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 140,
                        height: 140,
                        child: Image.network(
                          GridviewProvider.gridView[index].image,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: IconButton(
                          color: Colors.black,
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            Navigator.pushNamed(context, '/update_image',
                                arguments: <String, dynamic>{
                                  'index': index.toString(),
                                });
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Text(
                          GridviewProvider.gridView[index].title,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: IconButton(
                            color: Colors.black,
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              GridviewProvider.deleteImage(index);
                            },
                          ))
                    ],
                  ),
                ),
              );
            },
            itemCount: GridviewProvider.gridView.length);
      },
    );
  }
}
