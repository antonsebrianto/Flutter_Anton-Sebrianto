import 'dart:ui';

class ListContactsModel {
  String nama;
  String no_telp;
  DateTime date;
  Color? color;
  String? image;
  // String? username;

  ListContactsModel({
    required this.nama,
    required this.no_telp,
    required this.date,
    this.image,
    this.color,
    // this.username,
  });

  Map<String, dynamic> toMap() {
    return {
      'nama': nama,
      'no_telp': no_telp,
      'date': date,
      'color': color,
      'image': image,
      // 'username': username
    };
  }

  factory ListContactsModel.fromMap(Map<String, dynamic> map) {
    return ListContactsModel(
      nama: map['nama'],
      no_telp: map['no_telp'],
      date: map['date'],
      color: map['color'],
      image: map['image'],
      // username: map['username'],
    );
  }
}


// final List<ListContactsModel> contacts = [
//   ListContactsModel(
//       nama: "Name 1", no_telp: "082228905435", date: DateTime(2023, 3, 24)),
//   ListContactsModel(
//       nama: "Name 2", no_telp: "082228902464", date: DateTime(2023, 3, 24)),
// ];
