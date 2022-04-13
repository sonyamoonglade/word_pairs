
import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_pairs/Services/PairService.dart';
import 'package:word_pairs/inheritedWidgets/InheritedTodo.dart';
import 'package:word_pairs/models/Pair_model.dart';
import 'package:word_pairs/widgets/AddPair.dart';
import 'package:word_pairs/widgets/FavoriteList.dart';
import 'package:word_pairs/widgets/Flex.dart';
import 'package:word_pairs/widgets/MatchTown.dart';
import 'package:word_pairs/widgets/WordsList.dart';
export './HomePage.dart' show Pair;
class Pair {
  int id;
  String title;
  bool isFavorite;

  Pair(this.id, this.title, this.isFavorite);

}

class HomePage extends StatefulWidget {

  const HomePage({Key? key, required this.scaffoldTitle}) : super(key: key);

  final String scaffoldTitle;

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  late final List<Pair> pairs;

  @override
  void didChangeDependencies() {
    if(pairs.isNotEmpty) return;
    pairs = Provider.of<PairModel>(context).pairs;

    super.didChangeDependencies();
  }

  List<Widget> _buildAppBarButtons(){
    return [
      IconButton(
          onPressed: (){
            Navigator.push(context,MaterialPageRoute(
                builder: (ctx) => FavoriteList(pairs: pairs)
            ));
          },
          icon: const Icon(
              Icons.favorite_rounded
          )),
      IconButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const FlexContainer()
            ));
          },
          icon: const Icon(
              Icons.flag
          )),
      IconButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MatchTown()
            ));
          },
          icon: const Icon(
              Icons.javascript
          )),
    ];
  }

  AppBar _buildAppBar(){
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.scaffoldTitle, style: const TextStyle(fontSize: 18)),
          Row(
            children: _buildAppBarButtons() ,
          )
        ],
      ),

    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(),
      body:  SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children:  [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: const WordsList(),
            ),
            const Center(
                child: AddPair()
            )
          ],
        ),

      ),
    );
  }
}
