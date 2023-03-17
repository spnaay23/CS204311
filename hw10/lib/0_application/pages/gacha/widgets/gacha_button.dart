import 'package:cs311hw10/1_domain/usecases/gacha_use_case.dart';
import 'package:cs311hw10/1_domain/usecases/history_use_case.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GachaButton extends StatelessWidget {
  const GachaButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Padding(
          padding: const EdgeInsets.all(50),
          child: ElevatedButton(
            onPressed: () async {
              final gachaUseCase = Provider.of<GachaUseCase>(context, listen: false);
              final historyUseCase = Provider.of<HistoryUseCase>(context, listen: false);
              final newCharacter = await gachaUseCase.getRandomCharacter();
              historyUseCase.addCharacter(newCharacter);
            },
            child: Text(
              'Wish',
              style: Theme.of(context).textTheme.headline4,
            ),
          )),
    );
  }
}
