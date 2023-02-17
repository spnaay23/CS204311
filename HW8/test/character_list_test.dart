import 'package:cs311hw08/character_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'character_detail_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  testWidgets('CharacterList should display listview', (tester) async {
    final client = MockClient();
    when(client.get(Uri.parse('https://api.genshin.dev/characters')))
        .thenAnswer((_) async => Future.delayed(
            const Duration(seconds: 1),
            () => http.Response(
                '["albedo","aloy","amber","arataki-itto","ayaka","ayato"]',
                200)));
    await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: CharacterList(client: client))));

    await tester.pumpAndSettle();
    final findListView = find.byType(ListView);
    expect(findListView, findsOneWidget);
  });

  testWidgets('CharacterList should display listview',
      (tester) async {
    final client = MockClient();
    when(client.get(Uri.parse('https://api.genshin.dev/characters/')))
        .thenAnswer((_) async => Future.delayed(
            const Duration(seconds: 1),
            () => http.Response(
                'Not Found',
                400)));
    await tester.pumpWidget(MaterialApp(home: CharacterList(client: client)));
    await tester.pumpAndSettle();
    final findTextError = find.byType(Text);
    expect(findTextError, findsOneWidget);
  });
}
