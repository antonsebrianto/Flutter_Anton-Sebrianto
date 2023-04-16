import 'package:flutter/material.dart';
import 'package:flutter_platform_widget/FlutterForm/CreateContacts.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Memiliki judul pada appbar dengan judul "Create Contacts"',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CreateContatcs(),
      ),
    );
    expect(
        find.descendant(
          of: find.byType(AppBar),
          matching: find.text('Create Contacts'),
        ),
        findsOneWidget);
  });

  testWidgets('Memiliki icon (icon bebas)', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CreateContatcs(),
    ));
    expect(
        find.descendant(
            of: find.byType(Container),
            matching: find.byIcon(Icons.contact_page)),
        findsOneWidget);
  });

  testWidgets('Memiliki deskripsi halaman (text bebas)',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CreateContatcs(),
    ));
    expect(find.byKey(const Key("deskripsi-text")), findsOneWidget);
  });

  testWidgets('Buatlah title yang bertuliskan "Create New Contacts"',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CreateContatcs(),
    ));
    expect(find.text('Create New Contacts'), findsOneWidget);
  });

  testWidgets('Menampilkan sebuah form input nama',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CreateContatcs(),
    ));
    expect(find.byKey(const Key("_formNama")), findsOneWidget);
  });

  testWidgets('Menampilkan sebuah form input nomor',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CreateContatcs(),
    ));
    expect(find.byKey(const Key("_formNomor")), findsOneWidget);
  });

  testWidgets('Implementasikan date picker', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CreateContatcs(),
    ));
    expect(find.byKey(const Key("_formDatePicker")), findsOneWidget);
  });

  testWidgets('Implementasikan color picker', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CreateContatcs(),
    ));
    expect(find.byKey(const Key("_formColorPicker")), findsOneWidget);
  });

  testWidgets('Implementasikan file picker', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CreateContatcs(),
    ));
    expect(find.byKey(const Key("_formFilePicker"), skipOffstage: false),
        findsOneWidget);
  });

  testWidgets('Menampilkan tombol submit', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CreateContatcs(),
    ));
    expect(find.byKey(const Key("_buttonSubmit"), skipOffstage: false),
        findsOneWidget);
  });
}
