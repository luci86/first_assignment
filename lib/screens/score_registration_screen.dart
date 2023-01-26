import 'package:flutter/material.dart';

class ScoreScreenReg extends StatefulWidget {

  @override
  State<ScoreScreenReg> createState() => _ScoreScreenStateReg();
}

class _ScoreScreenStateReg extends State<ScoreScreenReg> {

  String username = '';
  String password = '';

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
                TextField(onChanged: (value) {username=value;},),
                TextField(onChanged: (value) {password=value;},),
                SizedBox(height: 30,),
                TextButton(onPressed: (){
                  print(username);
                  print(password);
                }, child: Text('Register'), style: style,)
              ],
            ),
          ),
        )

    );
  }
}