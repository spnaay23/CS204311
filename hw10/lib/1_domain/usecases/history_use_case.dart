import 'package:cs311hw10/1_domain/entities/genshin_character_entity.dart';
import 'package:cs311hw10/2_data/repositories/history_repo_impl.dart';
import 'package:flutter/foundation.dart';

class HistoryUseCase extends ChangeNotifier {
  final historyRepo = HistoryRepoImpl();
  void addCharacter(GenshinCharacterEntity newCharacter) {
    historyRepo.addCharacter(newCharacter);
    notifyListeners();
  }

  Future<List<GenshinCharacterEntity>> getHistory() async {
    return await historyRepo.getHistory();
  }
}