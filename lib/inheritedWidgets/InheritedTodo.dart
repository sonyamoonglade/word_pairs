import "package:flutter/material.dart";
import 'package:word_pairs/Services/PairService.dart';
import 'package:word_pairs/widgets/HomePage.dart';

class InheritedTodo extends InheritedWidget {

  // final List<Pair> pairs;
  // final Function addPair;
  // final Function deletePair;
  // final Function toggleFavorite;

  final PairService pairService = PairService();

  InheritedTodo({
    // required this.toggleFavorite,
    // required this.addPair,
    // required this.deletePair,
    // required this.pairs,
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  static InheritedTodo of(BuildContext context) {
    final InheritedTodo? result = context.dependOnInheritedWidgetOfExactType<InheritedTodo>();
    return result!;
  }



  @override
  bool updateShouldNotify(InheritedTodo oldWidget) {
    return true;
  }
}
