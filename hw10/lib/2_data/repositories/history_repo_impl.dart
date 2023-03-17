import 'package:cs311hw10/1_domain/entities/genshin_character_entity.dart';
import 'package:cs311hw10/1_domain/repositories/history_repo.dart';
import 'package:cs311hw10/2_data/databases/genshin_database.dart';

class HistoryRepoImpl implements HistoryRepo {
  GenshinDatabase db = GenshinDatabase();

  @override
  Future<List<GenshinCharacterEntity>> getHistory() async {
    return await db.getHistory;
  }

  @override
  void addCharacter(GenshinCharacterEntity newCharacter) {
    db.insert(newCharacter);
  }
  
}