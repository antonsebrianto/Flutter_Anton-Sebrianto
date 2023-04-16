class ProductModel {
  final String name;
  final String image;

  ProductModel({required this.name, required this.image});
}

List<ProductModel> products = [
  ProductModel(
      name: 'Velg Enkei Ring 17', image: 'images/velg-enkei-ring-17.png'),
  ProductModel(
      name: 'Velg Rossi Jari-Jari Ring 17',
      image: 'images/velg-rossi-jari-jari-ring-17.jpg'),
  ProductModel(name: 'Velg RCB Ring 17', image: 'images/velg-rcb-ring-17.jpeg'),
];
