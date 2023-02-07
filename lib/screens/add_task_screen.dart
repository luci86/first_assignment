import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTaskScreen extends StatelessWidget {

  final _firebase = FirebaseFirestore.instance;
  String score = '';
  final date = DateTime.now();
  late String formated = DateFormat('d.M.y').format(date);


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
          TextField(textAlign: TextAlign.center, onChanged: (value){
            score=value;
          },),
          ElevatedButton(style: style, onPressed: () {
            _firebase.collection('scores').add({'score' : score, 'date' : formated});
          }, child: Text('Add Score'),),
        ],
      ),
      ),
    );
  }
}