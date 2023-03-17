import 'package:cs311hw10/0_application/pages/BottomNavBar.dart';
import 'package:cs311hw10/0_application/pages/gacha/gacha_page.dart';
import 'package:cs311hw10/0_application/pages/history/history_page.dart';
import 'package:cs311hw10/0_application/widgets/genshin_web_view.dart';
// import 'package:cs311hw10/0_application/pages/history/widgets/history_web.dart';
import 'package:cs311hw10/1_domain/usecases/history_use_case.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '1_domain/usecases/gacha_use_case.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => GachaUseCase()),
      ChangeNotifierProvider(create: (_) => HistoryUseCase())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomNavBar(),
    );
  }
}
