import 'dart:convert';

import 'package:cs311hw10/1_domain/entities/genshin_character_entity.dart';
import 'package:cs311hw10/1_domain/repositories/gacha_repo.dart';
import 'package:http/http.dart' as http;

class GachaRepoImpl implements GachaRepo {
  final client = http.Client();

  @override
  Future<List<String>> getCharactersFromApi() async {
    final response =
        await client.get(Uri.parse('https://api.genshin.dev/characters/'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return List.from(json);
    } else {
      throw Exception('Fail to connect to API.');
    }
  }

  @override
  Future<GenshinCharacterEntity> getCharacterInfo(String name) async {
    final response =
        await client.get(Uri.parse('https://api.genshin.dev/characters/$name'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      json['id'] = name;
      return GenshinCharacterEntity.fromJson(json);
    } else {
      throw Exception('Fail to connect to API.');
    }
  }
}
