// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility in the flutter_test package. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_platform_widget/Assets-Dialog-Bottomsheet-Navigation/GridviewProvider.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'package:flutter_platform_widget/main.dart';
// import 'package:provider/provider.dart';

// void main() {
//   testWidgets('Judul halaman harus Flutter Platform Widget',
//       (WidgetTester tester) async {
//     //   await tester.pumpWidget(
//     //     const MyApp(),
//     //   );
//     //   expect(
//     //       find.descendant(
//     //         of: find.byType(AppBar),
//     //         matching: find.text('Flutter Platform Widget'),
//     //       ),
//     //       findsOneWidget);
//     // });
//     await tester.pumpWidget(
//       const MaterialApp(
//         home: MyApp(),
//       ),
//     );

//     //   // Find the title in the MaterialApp
//     expect(find.text('Flutter Platform Widget'), findsOneWidget);
//   });
//   //   expect(
//   //       find.descendant(
//   //         of: find.byType(Title),
//   //         matching: find.text('Flutter Platform Widget'),
//   //       ),
//   //       findsOneWidget);
//   // });
//   // testWidgets('Flutter Platform Widget', (WidgetTester tester) async {
//   //   // Build our app and trigger a frame.
//   //   await tester.pumpWidget(const MyApp());
//   //   expect(find.text('Flutter Platform Widget'), findsOneWidget);

//   //   // Verify that our counter starts at 0.
//   //   // expect(find.text('0'), findsOneWidget);
//   //   // expect(find.text('1'), findsNothing);

//   //   // // Tap the '+' icon and trigger a frame.
//   //   // await tester.tap(find.byIcon(Icons.add));
//   //   // await tester.pump();

//   //   // // Verify that our counter has incremented.
//   //   // expect(find.text('0'), findsNothing);
//   //   // expect(find.text('1'), findsOneWidget);
//   // });
// }
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
}
