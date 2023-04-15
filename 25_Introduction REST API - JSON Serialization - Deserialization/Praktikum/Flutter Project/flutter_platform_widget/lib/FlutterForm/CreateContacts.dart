import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DatabaseSQlite.dart';

class CreateContatcs extends StatefulWidget {
  const CreateContatcs({Key? key}) : super(key: key);

  @override
  State<CreateContatcs> createState() => _CreateContatcsState();
}

class _CreateContatcsState extends State<CreateContatcs> {
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
    super.initState();
    refreshContacts();
    checkLoginStatus();
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
          title: const Text("Create Contacts"),
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
              padding: const EdgeInsets.only(top: 81),
              child: const Icon(Icons.contact_page),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "Halo, $username",
                style: const TextStyle(
                    fontFamily: 'Roboto-Regular',
                    fontSize: 24,
                    color: Colors.black),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 10),
              child: const Text(
                "Create New Contacts",
                style: TextStyle(
                    fontFamily: 'Roboto-Regular',
                    fontSize: 24,
                    color: Color(0xff1C1B1F)),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 10),
              margin: const EdgeInsets.only(left: 40, right: 40),
              child: const Text(
                "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: 'Roboto-Regular',
                  fontSize: 14,
                  color: Color(0xff49454F),
                ),
              ),
            ),
            SizedBox(
              height: 35.0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.only(top: 30),
                  margin:
                      const EdgeInsetsDirectional.only(start: 40.0, end: 40.0),
                  height: 1.0,
                  color: Colors.black12,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 8),
                    margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    decoration: const BoxDecoration(
                      color: Color(0xffE7E0EC),
                    ),
                    child: TextFormField(
                      controller: namaController,
                      validator: (value) {
                        List list = value!.split(' ');
                        if (value.isEmpty) {
                          return 'Nama harus di isi';
                        } else if (list.length < 2) {
                          return 'Nama harus terdiri dari minimal 2 kata';
                        } else if (!RegExp(
                                r'^[A-Z][a-zA-Z]*(?: [A-Z][a-zA-Z]*)*$')
                            .hasMatch(value)) {
                          return 'Nama harus dimulai dengan huruf kapital';
                        } else if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                          return 'Nama tidak boleh mengandung angka atau karakter khusus';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        contentPadding: EdgeInsets.only(left: 16),
                        hintText: "Insert Your Name",
                        hintStyle: TextStyle(
                          fontFamily: 'Roboto-Regular',
                          fontSize: 16,
                        ),
                        labelText: "Name",
                        labelStyle: TextStyle(
                          fontFamily: 'Roboto-Regular',
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8),
                    margin: const EdgeInsets.only(
                        top: 15.0, left: 16.0, right: 16.0),
                    decoration: const BoxDecoration(
                      color: Color(0xffE7E0EC),
                    ),
                    child: TextFormField(
                      // keyboardType: TextInputType.phone,
                      controller: nomorController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nomor harus di isi';
                        } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'Nomor telepon harus terdiri dari angka saja';
                        } else if (value.length < 8) {
                          return 'Nomor telepon minimal 8 digit';
                        } else if (value.length > 15) {
                          return 'Nomor telepon maksimal 15 digit';
                        } else if (value[0] != '0') {
                          return 'Nomor telepon harus dimulai dengan angka 0';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        contentPadding: EdgeInsets.only(left: 16),
                        hintText: "+62 ....",
                        hintStyle: TextStyle(
                          fontFamily: 'Roboto-Regular',
                          fontSize: 16,
                        ),
                        labelText: "Nomor",
                        labelStyle: TextStyle(
                          fontFamily: 'Roboto-Regular',
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              contentPadding:
                  const EdgeInsets.only(top: 10, left: 16, right: 16),
              leading: const Text(
                'Date',
                style: TextStyle(
                  fontFamily: 'Roboto-Regular',
                  fontSize: 16,
                  color: Color(0xff1C1B1F),
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: TextButton(
                onPressed: () => _selectDate(context),
                child: const Text(
                  'Select',
                  style: TextStyle(
                    fontFamily: 'Roboto-Regular',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                '${_selectedDate.day}-${_selectedDate.month}-${_selectedDate.year}',
                style: const TextStyle(
                  fontFamily: 'Roboto-Regular',
                  fontSize: 14,
                  color: Color(0xff49454F),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 16),
              child: const Text(
                'Color',
                style: TextStyle(
                    fontFamily: 'Roboto-Regular',
                    fontSize: 16,
                    color: Color(0xff1C1B1F),
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              width: double.infinity,
              height: 50.0,
              margin: const EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                color: currentColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              margin: const EdgeInsets.only(left: 130, right: 130),
              child: RaisedButton(
                color: currentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Pick a color'),
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            pickerColor: pickerColor,
                            onColorChanged: changeColor,
                            showLabel: true,
                            pickerAreaHeightPercent: 0.8,
                          ),
                        ),
                        actions: [
                          FlatButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: const Text('Apply'),
                            onPressed: () {
                              onColorChanged(pickerColor);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text(
                  'Pick Color',
                  style: TextStyle(
                    fontFamily: 'Roboto-Regular',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 16),
              child: const Text(
                "Pick Files",
                style: TextStyle(
                  fontFamily: 'Roboto-Regular',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1C1B1F),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, top: 10),
              child: Text(
                _fileName ?? "No file selected.",
              ),
            ),
            _filePath != "" ? Image.file(File(_filePath)) : Container(),
            Container(
              margin: const EdgeInsets.only(left: 130, right: 130, top: 10),
              child: RaisedButton(
                onPressed: _openFilePicker,
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  "Pick and Open File",
                  style: TextStyle(
                    fontFamily: 'Roboto-Regular',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(top: 15, right: 15),
              child: SizedBox(
                width: 94,
                height: 40,
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                      backgroundColor: const Color(0xff6750A4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  onPressed: () async {
                    await tambahContact();

                    namaController.text = "";
                    nomorController.text = "";
                    _fileName = null;
                    _filePath = "";
                    currentColor = Colors.blue;
                    Navigator.pop(context);
                    setState(() {
                      refreshContacts();
                    });
                  },
                  child: const Text(
                    "Submit",
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
