

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_pairs/inheritedWidgets/InheritedTodo.dart';
import 'package:word_pairs/models/Pair_model.dart';
import 'package:word_pairs/widgets/HomePage.dart';


class WordsList extends StatefulWidget {
  
   const WordsList({ Key? key,}) : super(key: key);


  
  
  
  @override
  State<WordsList> createState() => _WordsListState();
}

class _WordsListState extends State<WordsList> {

  late List<Pair> pairs;
  late Function toggle;
  late Function delete;


  Widget conditionalLikeIcon(bool opt, int id){

    if(opt){
      return  IconButton(
        icon: const Icon(
            Icons.favorite,
            color: Colors.red,
        ),
        onPressed: () => toggle(id),
      );
    }
    return  IconButton(
      icon: const Icon(
        Icons.favorite_border,
        color: null,
      ),
      onPressed: () => toggle(id)

    );
  }

  Widget _buildAlertDialog(Pair pair, BuildContext ctx){
    return AlertDialog(
      title: const Text("Alert dialog title"),
      content: const Text("I am content"),
      actions: [
        TextButton(
          child: const Text("Ensure deletion"),
          onPressed: (){
            delete(pair.id);
            Navigator.pop(ctx);
          },
        ),
        TextButton(
          child: const Text("Regret"),
          onPressed: (){
            Navigator.pop(ctx);
          },
        )
      ],
    );
  }

  Widget _buildListTile(Pair pair){
   return ListTile(

      title: Text("${pairs.indexWhere((e) => e.id == pair.id) + 1 } ${pair.title}"),
      trailing: conditionalLikeIcon(pair.isFavorite,pair.id),
      onLongPress: (){
        showDialog(
            context: context,
            builder: (ctx){
              return _buildAlertDialog(pair, ctx);
            }
        );
      },
    );
  }
  
  Widget _buildRows(){

    List<Widget> pairRows = pairs.map((Pair pair) =>
       _buildListTile(pair)
    ).toList();

    List<Widget> resultRows = [];

    for(int i = 0; i < pairRows.length;i++ ){
      if(i == 0) {
        resultRows.add(pairRows[i]);
        continue;
      }
      resultRows.add(const Divider(height: 10));
      resultRows.add(pairRows[i]);
    }

    return ListView(
      padding: EdgeInsets.all(16),
      shrinkWrap: true,
      children: resultRows,
    );
  }

  @override
  void didChangeDependencies() {
    toggle = Provider.of<PairModel>(context, listen: false).toggleFavorite;
    delete = Provider.of<PairModel>(context, listen: false).deletePair;
    pairs = Provider.of<PairModel>(context).pairs;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {



    return pairs.isEmpty ?
        const Center(child: Text("You have no pairs : ("))
        : _buildRows();
    }

}
