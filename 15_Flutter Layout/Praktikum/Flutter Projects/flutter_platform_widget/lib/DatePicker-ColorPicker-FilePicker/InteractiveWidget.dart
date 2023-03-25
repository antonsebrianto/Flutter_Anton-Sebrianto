import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';

class InteractiveWidget extends StatefulWidget {
  const InteractiveWidget({Key? key}) : super(key: key);

  @override
  State<InteractiveWidget> createState() => _InteractiveWidgetState();
}

class _InteractiveWidgetState extends State<InteractiveWidget> {
  DateTime _selectedDate = DateTime.now();
  Color pickerColor = Colors.blue;
  Color currentColor = Colors.blue;
  String? _fileName;
  String? _filePath;

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
          _filePath = result.files.single.path;
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
          title: const Text("Interactive Widgets"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              contentPadding:
                  const EdgeInsets.only(top: 10, left: 10, right: 10),
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
                    // color: Color(0xff6750A4),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 10),
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
              padding: const EdgeInsets.only(left: 10),
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
              margin: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: currentColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const SizedBox(height: 20.0),
            RaisedButton(
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
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 10),
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
            Text(
              _fileName ?? "No file selected.",
            ),
            RaisedButton(
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
          ],
        ),
      ),
    );
  }
}
