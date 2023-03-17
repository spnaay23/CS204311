import 'package:cs311hw10/0_application/widgets/genshin_web_view.dart';
import 'package:cs311hw10/1_domain/entities/genshin_character_entity.dart';
import 'package:flutter/material.dart';

class HistoryIcon extends StatelessWidget {
  const HistoryIcon({Key? key, required this.character}) : super(key: key);

  final GenshinCharacterEntity character;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => GenshinWebView(character: character))));
      },
      child: Image.network('https://api.genshin.dev/characters/'
          '${character.id}/icon-big'),
    );
  }
}
