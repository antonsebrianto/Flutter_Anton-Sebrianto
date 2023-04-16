import 'package:flutter/material.dart';
import 'package:flutter_platform_widget/UserModel.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(brightness: Brightness.light),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff6200EE),
          title: const Center(child: Text("List View")),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: ListView.separated(
              itemBuilder: (ctx, i) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.green,
                    child: Text(
                      userList[i].name[0],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    userList[i].name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(userList[i].phoneNumber),
                );
              },
              separatorBuilder: (ctx, i) {
                return const Divider();
              },
              itemCount: userList.length),
        ),
      ),
    );
  }
}
