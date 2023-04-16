import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _secureText = true;
  bool isLoading = false;

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.white,
      primary: const Color.fromARGB(255, 62, 191, 57),
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.symmetric(vertical: 18),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ));

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  void _saveLoginInformation(String username) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('username', username);
  }

  void _onFormSubmitted() {
    final username = usernameController.text;
    _saveLoginInformation(username);
    if (username.isNotEmpty) {
      AlertDialog alert = AlertDialog(
        title: const Text("Login Berhasil"),
        content: const Text("Selamat Anda Berhasil Login"),
        actions: [
          TextButton(
            child: const Text('Ok'),
            onPressed: () =>
                Navigator.pushReplacementNamed(context, "/contacts"),
          ),
        ],
      );

      showDialog(context: context, builder: (context) => alert);
      return;
    } else {
      const snackBar = SnackBar(
        duration: Duration(seconds: 5),
        content: Text("Username dan password harus diisi"),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(brightness: Brightness.light),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login Page"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black12,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 4,
                    offset: const Offset(0, 4), // Shadow position
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 4,
                              offset: const Offset(0, 4), // Shadow position
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 20,
                              height: 20,
                              child: Icon(Icons.account_circle_outlined),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: TextFormField(
                                key: const Key("_formUsername"),
                                autofocus: false,
                                controller: usernameController,
                                decoration: const InputDecoration.collapsed(
                                    hintText: "Username"),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Username harus di isi';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        )
                        // ),
                        ),
                    const SizedBox(
                      height: 22,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22, vertical: 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 4,
                              offset: const Offset(0, 4), // Shadow position
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.key),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextFormField(
                                key: const Key("_formPassword"),
                                controller: passwordController,
                                obscureText: _secureText,
                                decoration: const InputDecoration.collapsed(
                                    hintText: "Password"),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password harus di isi';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            IconButton(
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              iconSize: 20,
                              onPressed: showHide,
                              icon: Icon(_secureText
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ],
                        )),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      key: const Key("_buttonSignIn"),
                      style: raisedButtonStyle,
                      child: const Text(
                        "SIGN IN",
                        style: TextStyle(fontSize: 16),
                      ),
                      onPressed: () {
                        setState(() {
                          isLoading = true;
                        });
                        _onFormSubmitted();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
