import 'package:flutter/material.dart';
import 'package:weekly1/ProductImageView.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        DrawerListTile(
          title: "Contact Us",
          onTilePressed: () {},
        ),
        DrawerListTile(
          title: "About Us",
          onTilePressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProductImageView()));
          },
        ),
        DrawerListTile(
          title: "Login",
          onTilePressed: () {},
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
