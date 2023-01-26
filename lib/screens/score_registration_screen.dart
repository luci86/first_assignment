import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/screens/score_screen.dart';

class ScoreScreenReg extends StatefulWidget {

  @override
  State<ScoreScreenReg> createState() => _ScoreScreenStateReg();
}

class _ScoreScreenStateReg extends State<ScoreScreenReg> {
  final _auth = FirebaseAuth.instance;
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
                TextField(textAlign: TextAlign.center,
                  onChanged: (value) {username=value;},),
                TextField(obscureText: true ,
                  textAlign: TextAlign.center,
                  onChanged: (value) {password=value;},),
                SizedBox(height: 30,),
                TextButton(onPressed: () async {
                  try {
                  final newUser = await _auth.createUserWithEmailAndPassword(email: username, password: password);
                  if (newUser != null) {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ScoreScreen()));
                  }
                }
                catch (e) {print (e);}},

                child: Text('Register'), style: style,)
              ],
            ),
          ),
        )

    );
  }
}