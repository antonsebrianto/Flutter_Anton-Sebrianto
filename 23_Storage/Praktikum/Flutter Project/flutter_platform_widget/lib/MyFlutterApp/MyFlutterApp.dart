import 'package:flutter/material.dart';
import 'package:flutter_platform_widget/MyFlutterApp/ListModel.dart';

class MyFlutterApp extends StatelessWidget {
  const MyFlutterApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(brightness: Brightness.light),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff6200EE),
            title: const Center(child: Text("My Flutter App")),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ListView.separated(
                itemBuilder: (ctx, i) {
                  return ListTile(
                    title: Text(
                      dataList[i].name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                },
                separatorBuilder: (ctx, i) {
                  return const Divider();
                },
                itemCount: dataList.length),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xff03DAC5),
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color(0xff6200EE),
            fixedColor: Colors.white,
            unselectedItemColor: Colors.white54,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                  ),
                  label: "Favorites"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                  ),
                  label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.info,
                  ),
                  label: "Information")
            ],
          ),
        ));
  }
}
