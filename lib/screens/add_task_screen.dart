import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {

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
          TextField(textAlign: TextAlign.center,),
          ElevatedButton(style: style, onPressed: () {}, child: Text('Add Score'),),
        ],
      ),
      ),
    );
  }
}