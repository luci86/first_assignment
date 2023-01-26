
import 'package:first_project/screens/score_login_screen.dart';
import 'package:first_project/screens/string_of_fire.dart';
import 'package:flutter/material.dart';

class StartingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle:TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black,),
        backgroundColor: Colors.deepOrangeAccent);

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: EdgeInsets.only(left: 50, right: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            Expanded(child: Container()),
            ElevatedButton (style:style, onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> ScoreScreenLog()), );},
              child: Text("Score Tracker", style: TextStyle(fontSize: 20),),),
            Expanded(child: Container()),
            ElevatedButton(style:style, onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> StringChoice()), );},
              child: Text("Practice", style: TextStyle(fontSize: 20),),),
            Expanded(child: Container()),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}