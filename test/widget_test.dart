import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:precvisao/main.dart';


void main() {
  testWidgets('Verifica o título e a entrada de texto', (WidgetTester tester) async {
    // Constrói o app e exibe o primeiro quadro.
    await tester.pumpWidget(MyApp());

    // Verifica se o título "Previsão do Tempo" está presente na AppBar.
    expect(find.text('Previsão do Tempo'), findsOneWidget);

    // Verifica se existe um campo de texto para entrada de cidade.
    expect(find.byType(TextField), findsOneWidget);

    // Verifica se o botão de consulta está presente.
    expect(find.widgetWithText(ElevatedButton, 'Consultar'), findsOneWidget);
  });
}
