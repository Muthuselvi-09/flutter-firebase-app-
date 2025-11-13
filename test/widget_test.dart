import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:event_management2/main.dart';

void main() {
  testWidgets('App loads and shows logo screen', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const EventApp());

    // Wait for the first frame
    await tester.pumpAndSettle();

    // Check if "Event Management" text from LogoScreen is shown
    expect(find.text('Event Management'), findsOneWidget);
  });
}
