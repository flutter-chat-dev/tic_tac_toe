// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tic_tac_toe/main.dart';
import 'package:tic_tac_toe/widgets/cell.dart';

void main() {
  testWidgets('There is game name exposed.', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.textContaining('Tic-Tac-Toe'), findsOneWidget);
  });

  testWidgets('There is board name exposed.', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that board name is Classic.
    expect(find.textContaining('Classic'), findsOneWidget);
  });

  testWidgets('There is board without circle and close icons.',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that board cells do not have cicle and close icons.
    expect(find.byIcon(Icons.close), findsNothing);
    expect(find.byIcon(Icons.circle_outlined), findsNothing);
  });

  testWidgets('There is cell state changing.', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that board cells do not have close icons.
    expect(find.byIcon(Icons.close), findsNothing);

    // Tap a cell.
    await tester.tap(find.byType(CellView).first);
    await tester.pump();

    // Verify that board cells has close icons.
    expect(find.byIcon(Icons.close), findsOneWidget);

    // Tap a cell.
    await tester.tap(find.byType(CellView).last);
    await tester.pump();

    // Verify that board cells has circle icons.
    expect(find.byIcon(Icons.circle_outlined), findsOneWidget);

    await expectLater(
        find.byType(MyApp), matchesGoldenFile('goldens/main.png'));
  });
}
