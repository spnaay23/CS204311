import 'package:cs311hw10/0_application/pages/history/widgets/history_icon.dart';
import 'package:cs311hw10/1_domain/usecases/history_use_case.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gacha History'),
      ),
      body: FutureBuilder(
        future: Provider.of<HistoryUseCase>(context).getHistory(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final characters = snapshot.data!;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemCount: characters.length,
              itemBuilder: (context, index) {
                return HistoryIcon(character: characters[index]);
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
