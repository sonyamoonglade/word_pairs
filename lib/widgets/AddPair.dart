import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_pairs/inheritedWidgets/InheritedTodo.dart';
import 'package:word_pairs/models/Pair_model.dart';

class AddPair extends StatefulWidget {

  const AddPair({Key? key}) : super(key: key);




  @override
  State<AddPair> createState() => _AddPairState();
}

class _AddPairState extends State<AddPair> {

  late Function addPair;

  final titleController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    titleController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    addPair = Provider.of<PairModel>(context, listen: false).addPair;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {


    return ElevatedButton(
        onPressed: (){
          showDialog(
              context: context,
              builder: (BuildContext ctx){
                return AlertDialog(

                  content: SizedBox(
                    height: 100,
                    child:Column(
                      children: [
                        TextFormField(
                          controller: titleController,
                        ),
                        ElevatedButton(
                            onPressed: (){
                              addPair(titleController.text);
                              titleController.clear();
                              Navigator.pop(ctx);
                            },
                            child: const Text("Create!"))
                      ],
                    ),
                  )
                );
              });
        },
        child: Text("Add pair!")
    );
  }
}
