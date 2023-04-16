import 'package:flutter/material.dart';
import 'package:weekly1/ProductModel.dart';
import 'package:weekly1/ShowImagePage.dart';

class ProductImageView extends StatelessWidget {
  const ProductImageView({Key? key}) : super(key: key);

  void showImage(
      BuildContext context, String nameProduct, String imageProduct) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => ShowImagePage(
              nameProduct: nameProduct, imageProduct: imageProduct)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('About Us'),
        ),
        backgroundColor: Colors.white30,
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: GridView.builder(
            itemCount: products.length,
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
                                child: Text('Tampilkan Product ?'),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                  height: 300,
                                  child: Image.asset(
                                    products[index].image,
                                    fit: BoxFit.cover,
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      showImage(context, products[index].name,
                                          products[index].image);
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
                            child: Image.asset(
                              products[index].image,
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
                                  products[index].name,
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
