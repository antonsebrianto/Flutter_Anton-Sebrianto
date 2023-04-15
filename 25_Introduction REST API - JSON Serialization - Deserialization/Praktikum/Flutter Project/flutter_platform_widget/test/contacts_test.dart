import 'package:flutter/material.dart';
import 'package:flutter_platform_widget/FlutterForm/Contacts.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // testWidgets('Judul halaman harus Contacts Screen',
  //     (WidgetTester tester) async {
  //   await tester.pumpWidget(
  //     const MaterialApp(
  //       home: Contacts(),
  //     ),
  //   );
  //   expect(find.text('List Contacts'), findsOneWidget);
  // });

  testWidgets('Judul halaman harus Contacts', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Contacts(),
      ),
    );
    expect(
        find.descendant(
          of: find.byType(AppBar),
          matching: find.text('Contacts'),
        ),
        findsOneWidget);
  });

  testWidgets('Listview Contacts', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Contacts(),
    ));
    expect(
        find.descendant(
            of: find.byType(Container), matching: find.text('List Contacts')),
        findsOneWidget);
  });

  // testWidgets('Find images in ListView', (WidgetTester tester) async {
  //   // Build the widget tree
  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: Scaffold(
  //         body: ListView(),
  //       ),
  //     ),
  //   );

  //   // Find the ListView
  //   final listViewFinder = find.byWidgetPredicate((widget) =>
  //       widget is ListView &&
  //       widget.scrollDirection == Axis.vertical &&
  //       widget.itemExtent == null &&
  //       widget.shrinkWrap == false);

  //   // Find the Images inside the ListView
  //   final imageFinder =
  //       find.descendant(of: listViewFinder, matching: find.byType(Image));

  //   // Check if there are 3 Images in the ListView
  //   expect(imageFinder, findsNWidgets(3));
  // });
}
