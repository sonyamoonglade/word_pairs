
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlexContainer extends StatelessWidget {
  const FlexContainer({Key? key}) : super(key: key);


  Future<List<String>> _getStrings () async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    return ["Cook Meal", "Spawn zombies"];
  }

  @override
  Widget build(BuildContext context) {
    Color bgColor = Colors.white;
    return Scaffold(
      appBar: AppBar(
        title:Text("Futures"),

      ),
      body:  Center(
          child: Container(

            child: FutureBuilder(
              // initialData: ["a"],
              future: _getStrings() ,
              builder: (BuildContext ctx,AsyncSnapshot<List<String>> result){
                List<String>? data = result.data;
                if(result.connectionState == ConnectionState.waiting){
                  return const CircularProgressIndicator();
                }

                return Container(
                  color: Colors.yellowAccent,
                  child: ListView.builder(

                      itemCount: data?.length ?? 0,
                      itemBuilder: (BuildContext ctx, int i){
                        return ListTile(
                          title: Text(data![i]),
                        );
                      }
                  ),
                );
              },
            ),
          )
      ),
    );
  }
}
