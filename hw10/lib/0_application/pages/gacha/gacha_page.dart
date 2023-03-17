import 'package:cs311hw10/0_application/pages/gacha/widgets/gacha_button.dart';
import 'package:cs311hw10/0_application/pages/gacha/widgets/gacha_image.dart';
import 'package:flutter/material.dart';

class GachaPage extends StatefulWidget {
  const GachaPage({Key? key}) : super(key: key);

  @override
  State<GachaPage> createState() => _GachaPageState();
}

class _GachaPageState extends State<GachaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Genshin Gacha'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          GachaImage(),
          GachaButton(),
        ],
      ),
    );
  }
}
