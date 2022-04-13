
import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:word_pairs/Game/Question.dart';

class MatchTown extends StatefulWidget {





 const MatchTown({Key? key}): super(key: key);

  @override
  State<MatchTown> createState() => _MatchTownState();
}

class _MatchTownState extends State<MatchTown> {


  // _MatchTownState(){
  //
  // }

  Queue<Question> _defineCorrectAnswers() {
    List<Question> games = [Question(
      imgUrl: "https://upload.wikimedia.org/wikipedia/commons/8/85/Saint_Basil%27s_Cathedral_and_the_Red_Square.jpg",
      cityName: "Moscow",
      correctAnswer: true
    ),Question(
        imgUrl: "https://cdn2.tu-tu.ru/image/pagetree_node_data/1/4646af3618e50dcf2cbddfb325446f11/",
        correctAnswer: true,
        cityName: "Saint-Petersburg"),Question(
       imgUrl: "https://www.iqconsultancy.ru/upload/iblock/660/MG_1_1_New_York_City-1.jpg",
       correctAnswer: false,
       cityName: "Las-Vegas"
     )];
    return Queue.of(games);
  }
  late Queue<Question> gameQ;

  @override
  void initState() {
    // TODO: implement initState
    gameQ = _defineCorrectAnswers();
    super.initState();
  }

  void _next (){
    Question prevFirst = gameQ.first;
    gameQ.removeFirst();
    gameQ.addLast(prevFirst);
  }

  void _checkAnswer(bool variant){
    if(variant == gameQ.first.correctAnswer){
      return setState(() {
        _next();
      });
    }
    Fluttertoast.showToast(msg:
    "Incorrect answer!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      fontSize: 16,
      textColor: Colors.white,
      backgroundColor: Colors.red[500]
    );

  }

  Widget _buildQuestion(){
    return  Text("Is it ${gameQ.first.cityName}?",style:
    GoogleFonts.getFont('Cairo',
      textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          letterSpacing: 1,
          fontSize: 23,
          color: Colors.grey[900]
      ),
    ),
    );
  }

  Widget _buildCityName(){
    return Text(gameQ.first.cityName,style: GoogleFonts.getFont('Cairo',
        textStyle: const TextStyle(
            height: (0.2),
            fontWeight: FontWeight.w500,
            fontSize: 14
        )
    ),
    );
  }

  Widget _buildQuestionPart(){
    return Flexible(
        flex:1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children:  [
            _buildQuestion(),
            _buildCityName(),
          ],
        )
    );
  }

  Widget _buildImagePart(){
    return Flexible(
        flex: 3,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(gameQ.first.imgUrl,
              height: 250,
              width: 250,
              fit: BoxFit.fill,
            ),
          ),
        )
    );
  }

  Widget _buildTrueFalseButtonsPart(){
    double screenWidth = MediaQuery.of(context).size.width;

    return Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: screenWidth / 6),
              child: TextButton(
                  onPressed: (){
                    _checkAnswer(false);
                  },
                  child:  Text("False",
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        shadows: const [
                          Shadow(color: Colors.black,blurRadius: 5,offset: Offset(0,0))
                        ]
                    ),)
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(right: screenWidth / 6),
              child: TextButton(
                onPressed: (){
                  _checkAnswer(true);
                },
                child: Text("True",
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      shadows: const [
                        Shadow(color: Colors.black,blurRadius: 5,offset: Offset(0,0))
                      ]
                  ),
                ),
              ),
            )
          ],
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    String imgUrl = "https://cutewallpaper.org/22/grey-gradient-wallpapers/1003920294.jpg";
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: screenHeight,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(imgUrl),
          fit: BoxFit.cover
          ),
          // borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          children: [
            _buildQuestionPart(),
            _buildImagePart(),
            _buildTrueFalseButtonsPart(),
          ],
        ),
      ),
    );
  }
}
