import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:simple_language_translator/classifier.dart';
import 'package:simple_language_translator/home.dart';

class MockClassifier extends Mock implements Classifier {}

void main() {
  late Home home;
  late MockClassifier classifier;

  setUp(() {
    classifier = MockClassifier();
    home = Home(classifier: classifier);
  });

  group('Home widget', () {
    testWidgets('displays dropdown and text fields', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: home));
      expect(find.byType(DropdownButton2), findsOneWidget);
      expect(find.byType(TextField), findsNWidgets(2));
    });

    testWidgets('displays translated output when input text is entered', (WidgetTester tester) async {
      when(classifier.classify('test input')).thenReturn('test output');
      await tester.pumpWidget(MaterialApp(home: home));

      await tester.enterText(find.byType(TextField).first, 'test input');
      await tester.pumpAndSettle();

      expect(find.text('test output'), findsOneWidget);
    });

    testWidgets('displays copied text on clipboard when copy icon is tapped', (WidgetTester tester) async {
      when(classifier.classify('test input')).thenReturn('test output');
      await tester.pumpWidget(MaterialApp(home: home));

      await tester.enterText(find.byType(TextField).first, 'test input');
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.copy_all));
      await tester.pumpAndSettle();

      final ClipboardData? clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
      expect(clipboardData!.text, equals('test output'));
    });

    testWidgets('displays pasted text on text field when paste icon is tapped', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: home));

      await Clipboard.setData(const ClipboardData(text: 'pasted text'));
      await tester.tap(find.byIcon(Icons.paste));
      await tester.pumpAndSettle();

      expect(find.text('pasted text'), findsOneWidget);
    });

    testWidgets('displays translated output for Geez to Amharic when dropdown is changed', (WidgetTester tester) async {
      when(classifier.classify('test input')).thenReturn('test output');
      await tester.pumpWidget(MaterialApp(home: home));

      await tester.tap(find.byType(DropdownButton2));
      await tester.pumpAndSettle();
      await tester.tap(find.text("Ge'ez to Amharic").last);
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).first, 'test input');
      await tester.pumpAndSettle();

      expect(find.text('test output'), findsOneWidget);
    });

    testWidgets('displays translated output for Amharic to Geez when dropdown is changed', (WidgetTester tester) async {
      when(classifier.classify('test input')).thenReturn('test output');
      await tester.pumpWidget(MaterialApp(home: home));

      await tester.tap(find.byType(DropdownButton2));
      await tester.pumpAndSettle();
      await tester.tap(find.text("Amharic to Ge'ez").last);
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).first, 'test input');
      await tester.pumpAndSettle();

      expect(find.text('test output'), findsOneWidget);
    });
  });
}
