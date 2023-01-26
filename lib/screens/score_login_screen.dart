import 'package:flutter/material.dart';
import 'package:first_project/screens/score_registration_screen.dart';

class ScoreScreenLog extends StatefulWidget {

  @override
  State<ScoreScreenLog> createState() => _ScoreScreenStateLog();
}

class _ScoreScreenStateLog extends State<ScoreScreenLog> {



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
                TextField(textAlign:TextAlign.center,
                onChanged: (value) {},),
                TextField(textAlign:TextAlign.center,
                    obscureText: true,
                    onChanged: (value) {},),
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