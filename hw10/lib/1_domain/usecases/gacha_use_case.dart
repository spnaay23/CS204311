import 'dart:math';

import 'package:cs311hw10/1_domain/entities/genshin_character_entity.dart';
import 'package:cs311hw10/2_data/repositories/gacha_repo_impl.dart';
import 'package:flutter/material.dart';

class GachaUseCase extends ChangeNotifier {
  GenshinCharacterEntity? randomCharacter;
  final gachaRepo = GachaRepoImpl();
  List<String> nation = ["mondstadt", "liyue", "inazuma", "sumeru"];
  Map<String, dynamic> character = {
    "mondstadt": [
      "albedo",
      "aloy",
      "amber",
      "barbara",
      "bennett",
      "diluc",
      "diona",
      "eula",
      "fischl",
      "ganyu",
      "jean",
      "kaeya",
      "klee",
      "lisa",
      "mona",
      "noelle",
      "razor",
      "rosaria",
      "sucrose",
      "traveler-anemo",
      "venti"
    ],
    "liyue": [
      "hu-tao",
      "beidou",
      "chongyun",
      "ganyu",
      "hu-tao",
      "keqing",
      "ningguang",
      "qiqi",
      "shenhe",
      "tartaglia",
      "traveler-geo",
      "xiangling",
      "xinyan",
      "yanfei",
      "yelan",
      "yun-jin",
      "zhongli"
    ],
    "inazuma": [
      "arataki-itto",
      "ayaka",
      "ayato",
      "gorou",
      "kazuha",
      "kokomi",
      "kuki-shinobu",
      "raiden",
      "sara",
      "sayu",
      "shikanoin-heizou",
      "thoma",
      "yae-miko",
      "yoimiya"
    ],
    "sumeru": ["collei", "tighnari", "traveler-dendro"]
  };
  Future<GenshinCharacterEntity> getRandomCharacter() async {
    String nationname = nation[Random().nextInt(nation.length)];
    String cha =
        character[nationname][Random().nextInt(character[nationname].length)];
    randomCharacter = await gachaRepo.getCharacterInfo(cha);
    notifyListeners();
    return randomCharacter!;
  }
}
