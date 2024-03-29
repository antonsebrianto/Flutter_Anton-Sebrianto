import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const themeDark =
        CupertinoThemeData.raw(Brightness.dark, null, null, null, null, null);
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter CupertinoApp",
      theme: themeDark,
      home: MyHomePage(title: 'CupertinoApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.title),
      ),
      child: const Center(
        child: Text("This is CupertinoApp"),
      ),
    );
  }
}
