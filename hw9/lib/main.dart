import 'package:flutter/material.dart';

import 'VideoPages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyYoutubeDemo(),
    );
  }
}

class MyYoutubeDemo extends StatefulWidget {
  // const MyYoutubeDemo({super.key});

  @override
  State<MyYoutubeDemo> createState() => _MyYoutubeDemoState();
}

class _MyYoutubeDemoState extends State<MyYoutubeDemo> {
  // late List<String> items;
  final List<String> itemsImages = [
    "images/Matsuri.jpg",
    "images/all.jpg",
    "images/1111.jpg",
    "images/anti.jpg",
    "images/Saturn.jpg"
  ];
  final List<String> itemsTitles = [
    "Fujii Kaze - Matsuri",
    "Kodaline - All I Want",
    "TAEYEON - 11:11 (male acoustic ver.) cover",
    "TXT - Anti-Romantic",
    "Sleeping At Last - Saturn"
  ];

  final List<String> itemsDates = [
    "3 months ago",
    "4 years ago",
    "4 months ago",
    "1 years ago",
    "6 years ago"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Metube Demo"),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => VideoPlayerScreen(n: index)));
              },
              child: Column(
                children: [
                  Image.asset(itemsImages[index]),
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text(itemsTitles[index]),
                    subtitle: Row(
                      children: [
                        Text("Username "),
                        SizedBox(
                          width: 10,
                        ),
                        Text(itemsDates[index])
                      ],
                    ),
                  ),
                ],
              ));
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
