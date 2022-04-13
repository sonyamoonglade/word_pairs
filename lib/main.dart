import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_pairs/models/Pair_model.dart';
import 'package:word_pairs/widgets/FavoriteList.dart';
import 'package:word_pairs/widgets/HomePage.dart';
import 'package:word_pairs/widgets/MatchTown.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => PairModel(),
    child: const MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (ctx) => const HomePage(scaffoldTitle: 'aboba'),
      },
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      // home: const HomePage(scaffoldTitle: 'Word Pair like App'),
    );
  }
}
