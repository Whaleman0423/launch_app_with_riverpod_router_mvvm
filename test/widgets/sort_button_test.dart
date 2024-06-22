import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/constants/values.dart';

void main() {
  testWidgets('SortButton displays correct text and icon',
      (WidgetTester tester) async {
    bool ascending = true;
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: SortButton(
          text: 'Flight number',
          ascending: ascending,
          onPressed: () {},
        ),
      ),
    ));

    expect(find.text('Flight number: oldest'), findsOneWidget);
    expect(find.byIcon(Icons.sort), findsOneWidget);
  });
}
