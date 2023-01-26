import 'package:flutter/material.dart';
import 'package:first_project/screens/score_registration_screen.dart';

class ScoreScreen extends StatefulWidget {

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {



  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle:TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black,),
        backgroundColor: Colors.deepOrangeAccent);

    return SafeArea(
        child:Scaffold(
          backgroundColor: Colors.blueGrey,
          body: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Column(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextField(onChanged: (value) {},),
                TextField(onChanged: (value) {},),
                SizedBox(height: 30,),
                TextButton(onPressed: (){}, child: Text('Log In'),style: style,),
                TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> ScoreScreenReg()));}, child: Text('Register'), style: style,)
              ],
            ),
          ),
        )

          );
  }
}