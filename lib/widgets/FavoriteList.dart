import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_pairs/models/Pair_model.dart';
import 'package:word_pairs/widgets/HomePage.dart';




class FavoriteList extends StatelessWidget {


  const FavoriteList({Key? key, required this.pairs}) : super(key: key);

   final List<Pair> pairs;




  @override
  Widget build(BuildContext context) {
  // pairs = Provider.of<PairModel>(context).pairs;
  late List<Pair> favoritePairs = pairs.where((e) => e.isFavorite == true).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite list"),

      ),
      body: SizedBox(
        child: favoritePairs.isNotEmpty ?
        ListView.builder(
            itemCount: favoritePairs.length,
            itemBuilder: (BuildContext ctx, int i){
              if(favoritePairs[i] != null){
                return ListTile(
                  title: Text(favoritePairs[i].title),
                  leading: const Icon(
                      Icons.favorite
                  ),
                );
              }
              return Text("");
            }
        ) :
        const Center(
          child: Text("You have not added any favorite pairs yet!"),
        )
      ),
    );
  }
}
