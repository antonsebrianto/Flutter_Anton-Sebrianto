import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weekly1',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Blackshop'),
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
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        clipBehavior: Clip.hardEdge,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 65.0),
                child: Image.asset('images/blackshop.png'),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: Text(
                  'Welcome to Blackshop and Happy Shopping',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              IntrinsicHeight(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Text(
                          'Contact Us',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Any question or remarks? Just write us a message!',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Form(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: TextFormField(
                                    controller: _firstnameController,
                                    decoration: const InputDecoration(
                                      labelText: 'First Name',
                                      hintText: 'Enter your first name',
                                      labelStyle: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: TextFormField(
                                    controller: _lastnameController,
                                    decoration: const InputDecoration(
                                      labelText: 'Last Name',
                                      hintText: 'Enter your last name',
                                      labelStyle: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: TextFormField(
                                    controller: _usernameController,
                                    decoration: const InputDecoration(
                                      labelText: 'Username',
                                      hintText: 'Enter your username',
                                      labelStyle: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: TextFormField(
                                    controller: _emailController,
                                    decoration: const InputDecoration(
                                      labelText: 'Email',
                                      hintText: 'Enter your email',
                                      labelStyle: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: TextFormField(
                                    controller: _messageController,
                                    maxLines: 4,
                                    decoration: const InputDecoration(
                                      labelText: 'Message',
                                      hintText: 'Enter your message',
                                      labelStyle: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Alert'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'Name: ${_firstnameController.text} ${_lastnameController.text}'),
                                    const SizedBox(height: 10),
                                    Text(
                                        'Username: ${_usernameController.text}'),
                                    const SizedBox(height: 10),
                                    Text('Email: ${_emailController.text}'),
                                    const SizedBox(height: 10),
                                    Text('Message: ${_messageController.text}'),
                                  ],
                                ),
                                actions: [
                                  ElevatedButton(
                                    child: const Text('Close'),
                                    onPressed: () {
                                      _firstnameController.text = '';
                                      _lastnameController.text = '';
                                      _usernameController.text = '';
                                      _emailController.text = '';
                                      _messageController.text = '';
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
