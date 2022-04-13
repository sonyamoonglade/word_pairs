


import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:word_pairs/widgets/HomePage.dart';

class PairModel extends ChangeNotifier{

  final List<Pair> pairs = [
    Pair(0,WordPair.random().asString,false),
    Pair(1,WordPair.random().asString,false),
    Pair(2,WordPair.random().asString,false),
  ];

  void toggleFavorite(int id){
    Pair pair = pairs.firstWhere((el) => el.id == id);

    pair.isFavorite = !pair.isFavorite;
    notifyListeners();
  }
  void addPair(String newTitle){
    Pair newPair = Pair(pairs.length,newTitle,false);

    pairs.add(newPair);
    notifyListeners();

  }
  void deletePair(int id){

    pairs.removeWhere((element) => element.id == id);
    notifyListeners();

  }

}