import 'package:cs311hw08/character_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'character_detail_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  testWidgets('CharacterList should display a character details',
      (tester) async {
    final client = MockClient();

    when(client.get(Uri.parse('https://api.genshin.dev/characters/zhongli')))
        .thenAnswer((_) async => Future.delayed(
            const Duration(seconds: 1),
            () => http.Response(
                '{"name":"Zhongli","vision":"Geo","weapon":"Polearm","nation":"Liyue","description":"A mysterious expert contracted by the Wangsheng Funeral Parlor. Extremely knowledgeable in all things."}',
                200)));
    await tester.pumpWidget(MaterialApp(
        home: CharacterDetail(
      client: client,
      name: 'zhongli',
    )));

    await tester.pumpAndSettle();
    final findDetail = find.byType(Column);
    expect(findDetail, findsOneWidget);
  });

  testWidgets('CharacterList should display detail', (tester) async {
    final client = MockClient();
    when(client.get(Uri.parse('https://api.genshin.dev/characters/zhongli')))
        .thenAnswer((_) async => Future.delayed(
            const Duration(seconds: 1), () => http.Response('Not Found', 400)));
    await tester.pumpWidget(MaterialApp(
        home: CharacterDetail(
      client: client,
      name: 'zhongli',
    )));
    await tester.pumpAndSettle();
    final findTextError = find.byType(Text);
    expect(findTextError, findsWidgets);
  });
}
