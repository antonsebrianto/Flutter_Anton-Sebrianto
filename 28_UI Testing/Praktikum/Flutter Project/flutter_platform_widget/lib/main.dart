import 'package:flutter/material.dart';
import 'package:flutter_platform_widget/Assets-Dialog-Bottomsheet-Navigation/AddImageForm.dart';
import 'package:flutter_platform_widget/Assets-Dialog-Bottomsheet-Navigation/GridviewProvider.dart';
import 'package:flutter_platform_widget/Assets-Dialog-Bottomsheet-Navigation/ImageGridviewPage.dart';
import 'package:flutter_platform_widget/Assets-Dialog-Bottomsheet-Navigation/UpdateImageForm.dart';
import 'package:flutter_platform_widget/DatePicker-ColorPicker-FilePicker/InteractiveWidget.dart';
import 'package:flutter_platform_widget/DrawerScreen.dart';
import 'package:flutter_platform_widget/FlutterForm/Contacts.dart';
import 'package:flutter_platform_widget/FlutterForm/CreateContacts.dart';
import 'package:flutter_platform_widget/FlutterForm/LoginScreen.dart';
import 'package:flutter_platform_widget/FlutterForm/UpdateContacts.dart';
import 'package:flutter_platform_widget/HomeScreen.dart';
import 'package:flutter_platform_widget/Intro-AdvanceRestAPI/ContactAPI.dart';
import 'package:flutter_platform_widget/Intro-AdvanceRestAPI/DiceBearPage.dart';
import 'package:flutter_platform_widget/Intro-AdvanceRestAPI/FormPost.dart';
import 'package:flutter_platform_widget/Intro-AdvanceRestAPI/FormPut.dart';
import 'package:flutter_platform_widget/Intro-AdvanceRestAPI/ImageDicebear.dart';
import 'package:flutter_platform_widget/ListViewPage.dart';
import 'package:flutter_platform_widget/MyFlutterApp/MyFlutterApp.dart';
import 'package:flutter_platform_widget/SettingsScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GridviewProvider>(
          create: (context) => GridviewProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Platform Widget',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => const MyHomePage(title: 'MaterialApp'),
          "/home": (context) => const HomeScreen(),
          "/settings": (context) => const SettingsScreen(),
          "/list_view_page": (context) => const ListViewPage(),
          "/my_flutter_app": (context) => const MyFlutterApp(),
          "/login": (context) => const LoginScreen(),
          "/contacts": (context) => const Contacts(),
          "/interactive_widget": (context) => const InteractiveWidget(),
          "/image_gridview": (context) => ImageGridviewPage(),
          "/add_image": (context) => const AddImageForm(),
          "/post_contact": (context) => const FormContactsAPI(),
          "/put_request": (context) => const FormPut(),
          "/dicebear": (context) => const DiceBearPage(),
          "/contact_api": (context) => const ContactAPI(),
          "/image_dicebear": (context) => const ImageDicebear(),
        },
        onGenerateRoute: (settings) {
          final tween = Tween(begin: 0.0, end: 1.0);
          switch (settings.name) {
            case '/create_contacts':
              return PageRouteBuilder(
                  settings: settings,
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const CreateContatcs(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          ScaleTransition(
                              scale: animation.drive(tween), child: child));
            case '/update_contacts':
              return PageRouteBuilder(
                  settings: settings,
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const UpdateContacts(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          ScaleTransition(
                              scale: animation.drive(tween), child: child));
            case '/update_image':
              return PageRouteBuilder(
                  settings: settings,
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const UpdateImageForm(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          ScaleTransition(
                              scale: animation.drive(tween), child: child));
          }
        },
      ),
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
  int selectedIndex = 0;

  final List<Widget> _list = [
    const HomeScreen(),
    const SettingsScreen(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const DrawerScreen(),
      body: Center(
        child: _list.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: onItemTapped,
      ),
    );
  }
}
