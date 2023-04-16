import 'package:flutter/material.dart';
import 'package:flutter_platform_widget/MyFlutterApp/MyFlutterApp.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Memiliki judul pada appbar dengan judul "My Flutter App"',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MyFlutterApp(),
    ));
    expect(
        find.descendant(
          of: find.byType(AppBar),
          matching: find.text("My Flutter App"),
        ),
        findsOneWidget);
  });

  testWidgets('Menampilkan icon search', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MyFlutterApp(),
    ));
    expect(
        find.descendant(
          of: find.byType(AppBar),
          matching: find.byIcon(Icons.search),
        ),
        findsOneWidget);
  });

  testWidgets('Menampilkan nama list data', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MyFlutterApp(),
    ));
    expect(find.byKey(const Key('_nameListData'), skipOffstage: false),
        findsOneWidget);
  });

  testWidgets('Menampilkan button floatingActionButton add',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MyFlutterApp(),
    ));
    expect(find.byIcon(Icons.add), findsOneWidget);
  });

  testWidgets('Menampilkan Bottom Navigation Bar', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MyFlutterApp(),
    ));
    expect(find.byKey(const Key("_bottomNavBar")), findsOneWidget);
  });
}
