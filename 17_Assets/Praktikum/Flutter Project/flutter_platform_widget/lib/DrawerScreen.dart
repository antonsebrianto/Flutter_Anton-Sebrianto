import 'package:flutter/material.dart';
import 'package:flutter_platform_widget/DatePicker-ColorPicker-FilePicker/InteractiveWidget.dart';
import 'package:flutter_platform_widget/FlutterForm/Contacts.dart';
import 'package:flutter_platform_widget/ListViewPage.dart';
import 'package:flutter_platform_widget/MyFlutterApp/MyFlutterApp.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        DrawerListTile(
          title: "Home",
          onTilePressed: () {},
        ),
        DrawerListTile(
          title: "Settings",
          onTilePressed: () {},
        ),
        DrawerListTile(
          title: "Listview",
          onTilePressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ListViewPage()));
          },
        ),
        DrawerListTile(
          title: "My Flutter App",
          onTilePressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyFlutterApp()));
          },
        ),
        DrawerListTile(
          title: "Flutter Form",
          onTilePressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Contacts()));
          },
        ),
        DrawerListTile(
          title: "Interactive Widget",
          onTilePressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const InteractiveWidget(),
              ),
            );
          },
        ),
      ],
    ));
  }
}

class DrawerListTile extends StatelessWidget {
  // final IconData? iconData;
  final String? title;
  final VoidCallback? onTilePressed;
  const DrawerListTile({Key? key, this.title, this.onTilePressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      title: Text(
        title!,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
