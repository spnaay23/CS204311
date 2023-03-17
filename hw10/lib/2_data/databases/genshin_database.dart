import '../../1_domain/entities/genshin_character_entity.dart';

class GenshinDatabase {
  final List<GenshinCharacterEntity> db = [];

  void insert(GenshinCharacterEntity newCharacter) {
    db.add(newCharacter);
  }

  Future<List<GenshinCharacterEntity>> get getHistory async {
    Future.delayed(const Duration(seconds: 1));
    return db;
  }
}