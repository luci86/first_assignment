import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';



class AddTaskScreen extends StatelessWidget {

  final scoreTextController = TextEditingController();
  final _firebase = FirebaseFirestore.instance;
  String score = '';
  final date = DateTime.now();
  late String formated = DateFormat('d.M.y').format(date);
  User? user = FirebaseAuth.instance.currentUser;
  late String? email = user?.email;




  final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle:TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black,),
      backgroundColor: Colors.deepOrangeAccent);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.deepOrangeAccent.shade200,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30)
          ),
        ),
      child: Column(
        children: [
          TextField(textAlign: TextAlign.center, controller: scoreTextController, onChanged: (value){
            score=value;
          },),
          ElevatedButton(style: style, onPressed: () {
            scoreTextController.clear();
            _firebase.collection('scores').add({'score' : score, 'date' : formated, 'user' : email});
          }, child: Text('Add Score'),),
        ],
      ),
      ),
    );
  }
}