import 'package:first_flutter_app/src/app.dart';
import 'package:first_flutter_app/src/widgets/roll_events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Find dice screen title', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Dice Onboarding'), findsOneWidget);
  });

  testWidgets('Find initial data of dice', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    Finder textFind = find.text('ROLL');
    expect(textFind, findsWidgets);
  });

  testWidgets('Valid dice values', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    bool expected = true;

    await tester.tap(find.byIcon(Icons.casino));
    await tester.pumpAndSettle(new Duration(seconds: 2));

    List<Text> _listRollValues =
        List<Text>.from(tester.widgetList(find.descendant(
      of: find.byType(RollEvents),
      matching: find.byType(Text),
    )));

    bool _validRollValues(List<Text> listRollValues) {
      var rollValues = ['1', '2', '3', '4', '5', '6'];
      for (Text _text in listRollValues) {
        if (!rollValues.contains(_text.data)) return false;
      }
      return true;
    }

    expect(_validRollValues(_listRollValues), expected);
  });
}
