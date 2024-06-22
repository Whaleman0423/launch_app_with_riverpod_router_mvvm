import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/constants/values.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  testWidgets('cachedImage displays image from URL',
      (WidgetTester tester) async {
    const imageUrl = 'https://images2.imgbox.com/40/e3/GypSkayF_o.png';

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: cachedImage(imageUrl),
      ),
    ));

    final cachedNetworkImageFinder = find.byType(CachedNetworkImage);
    expect(cachedNetworkImageFinder, findsOneWidget);
  });
}
