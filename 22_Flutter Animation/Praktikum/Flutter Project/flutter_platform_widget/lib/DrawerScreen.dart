import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            Navigator.pushNamed(context, '/list_view_page');
          },
        ),
        DrawerListTile(
          title: "My Flutter App",
          onTilePressed: () {
            Navigator.pushNamed(context, '/my_flutter_app');
          },
        ),
        DrawerListTile(
          title: "Flutter Form",
          onTilePressed: () async {
            SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            if (sharedPreferences.getString("username") != null) {
              Navigator.pushNamed(context, "/contacts");
            } else {
              Navigator.pushNamed(context, '/login');
            }
          },
        ),
        DrawerListTile(
          title: "Interactive Widget",
          onTilePressed: () {
            Navigator.pushNamed(context, '/interactive_widget');
          },
        ),
        DrawerListTile(
          title: "Gridview",
          onTilePressed: () {
            Navigator.pushNamed(context, '/image_gridview');
          },
        ),
      ],
    ));
  }
}

class DrawerListTile extends StatelessWidget {
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
