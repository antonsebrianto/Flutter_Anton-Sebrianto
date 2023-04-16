import 'package:flutter/material.dart';
import 'package:flutter_platform_widget/FlutterForm/LoginScreen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Memiliki judul pada appbar dengan judul "Login Page"',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));
    expect(
        find.descendant(
          of: find.byType(AppBar),
          matching: find.text("Login Page"),
        ),
        findsOneWidget);
  });

  testWidgets('Menampilkan sebuah form input username beserta icon',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));
    expect(find.byKey(const Key("_formUsername")), findsOneWidget);
    expect(find.byIcon(Icons.account_circle_outlined), findsOneWidget);
  });

  testWidgets('Menampilkan sebuah form input password beserta icon',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));
    expect(find.byKey(const Key("_formPassword")), findsOneWidget);
    expect(find.byIcon(Icons.key), findsOneWidget);
  });

  testWidgets('Menampilkan button Sign In', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));
    expect(find.byKey(const Key("_buttonSignIn")), findsOneWidget);
  });
}
