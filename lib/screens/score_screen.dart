import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child:Scaffold(
          backgroundColor: Colors.blueGrey,
          floatingActionButton: FloatingActionButton( backgroundColor: Colors.deepOrangeAccent,
            onPressed: (){},
          child: const Icon (Icons.add, size: 40, color: Colors.white,),),
        )

          );
  }

}