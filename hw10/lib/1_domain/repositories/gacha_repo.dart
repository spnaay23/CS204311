import 'package:cs311hw10/1_domain/entities/genshin_character_entity.dart';

abstract class GachaRepo {
  Future<List<String>> getCharactersFromApi();
  Future<GenshinCharacterEntity> getCharacterInfo(String name);
}