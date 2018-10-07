// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seeatree_4_aed/pages/addtree/3_health_page.dart';
import 'package:seeatree_4_aed/homepage.dart';
import 'package:seeatree_4_aed/loginpage.dart'; 
import 'package:seeatree_4_aed/pages/information/rules_page.dart';


import 'package:seeatree_4_aed/main.dart';

typedef OnObservation = void Function(Route<dynamic> route, Route<dynamic> previousRoute);

class TestObserver extends NavigatorObserver {
  OnObservation onPushed;
  OnObservation onPopped;
  OnObservation onRemoved;
  OnObservation onReplaced;

  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (onPushed != null) {
      onPushed(route, previousRoute);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (onPopped != null) {
      onPopped(route, previousRoute);
    }
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (onRemoved != null)
      onRemoved(route, previousRoute);
  }

  @override
  void didReplace({ Route<dynamic> oldRoute, Route<dynamic> newRoute }) {
    if (onReplaced != null)
      onReplaced(newRoute, oldRoute);
  }
}


void main() {
  testWidgets('Health screen incrementer', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(new MaterialApp(home: new HealthConditionsPage(),));
  
    // Verify that our counter starts at 0.
    expect(find.text('1. Excellent'), findsOneWidget);
    //expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.widgetWithText(CheckboxListTile, 'A lot of fallen leaves'));
    await tester.tap(find.widgetWithText(CheckboxListTile, 'Dropped branches with no leaves'));
    await tester.tap(find.widgetWithText(CheckboxListTile, 'Rotten wood'));
    await tester.pump();
    //expect(find., findsOneWidget);
    expect(find.text('2. Good'), findsOneWidget);

  });

  testWidgets('Health screen checkbox', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(new MaterialApp(home: new HealthConditionsPage(),));
  
    // Verify that our counter starts at 0.
    expect(find.text('1. Excellent'), findsOneWidget);
    //expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.widgetWithText(CheckboxListTile, 'A lot of fallen leaves'));
    await tester.pump();
    await tester.tap(find.widgetWithText(CheckboxListTile, 'A lot of fallen leaves'));
    await tester.pump();
    //expect(find., findsOneWidget);
    expect(find.text('1. Excellent'), findsOneWidget);

  });

  


}

