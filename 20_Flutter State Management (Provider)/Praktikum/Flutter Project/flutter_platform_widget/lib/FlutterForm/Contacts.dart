import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DatabaseSQlite.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  State<Contacts> createState() => _Contacts();
}

class _Contacts extends State<Contacts> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nomorController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String username = "", selectedId = "";

  DateTime _selectedDate = DateTime.now();
  Color pickerColor = const Color(0xffEADDFF);
  Color currentColor = Colors.blue;
  String? _fileName;
  String _filePath = "";

  List<Map<String, dynamic>> contacts = [];
  @override
  void initState() {
    refreshContacts();
    checkLoginStatus();
    super.initState();
  }

//fungsi refresh contacts
  void refreshContacts() async {
    final data = await DatabaseSQlite.getContacts();
    setState(() {
      contacts = data;
    });
  }

//fungsi tambah contacts
  Future<void> tambahContact() async {
    await DatabaseSQlite.tambahContact(
        namaController.text,
        nomorController.text,
        _selectedDate.toString(),
        pickerColor.toString(),
        _filePath.toString());
    refreshContacts();
  }

//fungsi ubah contacts
  Future<void> ubahContacts(int id) async {
    await DatabaseSQlite.ubahContacts(
        id,
        namaController.text,
        nomorController.text,
        _selectedDate.toString(),
        pickerColor.toString(),
        _filePath.toString());
    refreshContacts();
  }

  void formContacts(int id) async {
    final dataContacts = contacts.firstWhere((element) => element['id'] == id);
    namaController.text = dataContacts['nama'];
    nomorController.text = dataContacts['no_telp'];
    _selectedDate = DateTime.parse(dataContacts['tanggal']);
    pickerColor = Color(int.parse(
        dataContacts['color'].toString().split('(')[1].split(')')[0]));
    _filePath = dataContacts['file'];
  }

  //fungsi hapus contacts
  Future<void> hapusContacts(int id) async {
    await DatabaseSQlite.hapusContacts(id);
    refreshContacts();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  checkLoginStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("username") == null) {
      Navigator.pushNamed(context, "/login");
    } else {
      setState(() {
        username = sharedPreferences.getString("username").toString();
      });
    }
  }

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  void onColorChanged(Color color) {
    setState(() => currentColor = color);
  }

  void _openFilePicker() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );

      if (result != null) {
        setState(() {
          _fileName = result.files.single.name;
          _filePath = result.files.first.path!;
        });
      }
    } catch (e) {
      print("Error while picking the file: " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(brightness: Brightness.light),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff6750A4),
          title: const Text("Contacts"),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.clear();
                Navigator.pushReplacementNamed(context, "/login");
              },
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 59),
              child: const Text(
                "List Contacts",
                style: TextStyle(
                  fontFamily: 'Roboto-Regular',
                  fontSize: 24,
                  color: Color(0xff1C1B1F),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, i) {
                    return ListTile(
                      leading: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: contacts[i]['color'].runtimeType != Null
                              ? Color(int.parse(contacts[i]['color']
                                  .toString()
                                  .split('(')[1]
                                  .split(')')[0]))
                              : const Color(0xffEADDFF),
                          shape: BoxShape.circle,
                        ),
                        width: 50,
                        height: 50,
                        child: contacts[i]['file'].runtimeType != Null &&
                                contacts[i]['file'] != ""
                            ? Image.file(
                                File(contacts[i]['file']),
                                fit: BoxFit.cover,
                              )
                            : Center(
                                child: Text(
                                  contacts[i]['nama'][0],
                                  style: const TextStyle(
                                    fontFamily: 'Roboto-Regular',
                                    fontSize: 16,
                                    color: Color(0xff21005D),
                                  ),
                                ),
                              ),
                      ),
                      title: Text(
                        contacts[i]['nama'],
                        style: const TextStyle(
                          fontFamily: 'Roboto-Regular',
                          fontSize: 16,
                          color: Color(0xff1C1B1F),
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            contacts[i]['no_telp'],
                            style: const TextStyle(
                              fontFamily: 'Roboto-Regular',
                              fontSize: 14,
                              color: Color(0xff49454F),
                            ),
                          ),
                          Text(
                            DateFormat('dd-MM-yyyy').format(
                              DateTime.parse(
                                contacts[i]['tanggal'],
                              ),
                            ),
                          ),
                        ],
                      ),
                      trailing: Wrap(
                        spacing: 23,
                        children: [
                          InkWell(
                            onTap: () {
                              formContacts(contacts[i]['id']);
                              selectedId = contacts[i]['id'].toString();
                              Navigator.pushNamed(context, '/update_contacts',
                                  // arguments: selectedId);
                                  arguments: <String, dynamic>{
                                    'id': contacts[i]['id'],
                                    'nama': contacts[i]['nama'],
                                    'no_telp': contacts[i]['no_telp'],
                                    'tanggal': contacts[i]['tanggal'],
                                    'color': contacts[i]['color'],
                                    'file': contacts[i]['file'],
                                  });
                            },
                            child: const Icon(
                              Icons.edit_outlined,
                              color: Color(0xff1C1B1F),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              hapusContacts(contacts[i]['id']);
                            },
                            child: const Icon(
                              Icons.delete_outline,
                              color: Color(0xff1C1B1F),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (ctx, i) {
                    return const Divider();
                  },
                  itemCount: contacts.length),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 15, right: 15),
              child: SizedBox(
                width: 94,
                height: 40,
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                      backgroundColor: const Color(0xff6750A4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  onPressed: () {
                    Navigator.pushNamed(context, '/create_contacts');
                  },
                  child: const Text(
                    "Create Contacts",
                    style: TextStyle(
                      fontFamily: 'Roboto-Regular',
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
