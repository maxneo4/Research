// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:js';

import 'package:flutter_test/flutter_test.dart';

import 'package:manejo_archivos/providers/Numero_Question_provider.dart';
import 'package:manejo_archivos/utils/show_verification_utils.dart';

void main() {
  testWidgets('Decodificar', (WidgetTester tester) async {
    NumeroQuestion N = new NumeroQuestion();
    List<int> result = N.deco('1, 2, 3, 4');
    expect(result, [1,2,3,4]);
  });

  testWidgets('validator answer', (WidgetTester tester) async {
    bool result = validator('casas Pasas NAChos', 'casas    pAsas NaChos');
    expect(result, true);
  });

}
