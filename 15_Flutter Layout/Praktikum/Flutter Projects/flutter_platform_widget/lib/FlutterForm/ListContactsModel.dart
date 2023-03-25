import 'dart:ui';

class ListContactsModel {
  String nama;
  String no_telp;
  DateTime date;
  Color? color;
  String? image;

  ListContactsModel({
    required this.nama,
    required this.no_telp,
    required this.date,
    this.image,
    this.color,
  });
}

final List<ListContactsModel> contacts = [
  ListContactsModel(
      nama: "Name 1", no_telp: "082228905435", date: DateTime(2023, 3, 24)),
  ListContactsModel(
      nama: "Name 2", no_telp: "082228902464", date: DateTime(2023, 3, 24)),
];
