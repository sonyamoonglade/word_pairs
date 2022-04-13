


import 'package:english_words/english_words.dart';
import 'package:word_pairs/widgets/HomePage.dart';

class PairService {

  final List<Pair> pairs = [
    Pair(0,WordPair.random().asString,false),
    Pair(1,WordPair.random().asString,false),
    Pair(2,WordPair.random().asString,false),
  ];

  void toggleFavorite(int id){
    Pair pair = pairs.firstWhere((el) => el.id == id);

      pair.isFavorite = !pair.isFavorite;

  }
  void addPair(String newTitle){
    Pair newPair = Pair(pairs.length,newTitle,false);

      pairs.add(newPair);

  }
  void deletePair(int id){

      pairs.removeWhere((element) => element.id == id);

  }


}