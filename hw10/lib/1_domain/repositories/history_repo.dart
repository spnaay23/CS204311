import 'package:cs311hw10/1_domain/entities/genshin_character_entity.dart';

abstract class HistoryRepo {
  Future<List<GenshinCharacterEntity>> getHistory();
  void addCharacter(GenshinCharacterEntity newCharacter);
}