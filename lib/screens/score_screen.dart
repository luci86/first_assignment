import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/screens/add_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:first_project/util/username.dart';




final _firestore = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;





class ScoreScreen extends StatefulWidget {
  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {


  @override
  void initState() {
    super.initState();

  }

  @override

  Widget build(BuildContext context) {




    return SafeArea(
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          leading: null,
          actions: [
            IconButton(
                onPressed: () async {
                  await _auth.signOut();
                  Navigator.pop(context);

                },
                icon: Icon(Icons.close))
          ],
        ),
        body: Column(
          children: [
            ScoreStream()
          ],
        ),
        backgroundColor: Colors.blueGrey,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrangeAccent,
          onPressed: () {
            showModalBottomSheet(
                context: context, builder: (context) => AddTaskScreen());
          },
          child: const Icon(
            Icons.add,
            size: 40,
            color: Colors.white,
          ),
        ),
      ));
  }
}


class ScoreStream extends StatefulWidget {

  @override
  State<ScoreStream> createState() => _ScoreStreamState();
}



class _ScoreStreamState extends State<ScoreStream> {
  @override
  Widget build(BuildContext context) {

    String user  = Provider.of<Username>(context).username;

    return Consumer<Username>(
      builder: (context, value, child) => StreamBuilder(
        stream: _firestore.collection('scores').where('user', isEqualTo: user).snapshots(),
        builder:  (context, snapshot){
          if (snapshot.hasData){
            final scores = snapshot.data?.docs;
            List <ScoreDisplay> scoreWidgets = [];
            for (var score in scores!) {
              final scoreResults = score.data().values.elementAt(1);
              String scoreResult = scoreResults.toString();
              final scoreDate = score.data().values.elementAt(0);
              String date = scoreDate.toString();
              final scoreWidget = ScoreDisplay(scoreResult, date);
              scoreWidgets.add(scoreWidget);

            }

            return Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                children: scoreWidgets,
              ),
            );
          }
          return Text('This is where the results go');

        },
      ),
    );
  }
}



class ScoreDisplay extends StatelessWidget {

  ScoreDisplay(this.scoreValue, this.dateValue);

  int score = 0;
  int date = 0;
  late String scoreValue = score.toString();
  late String dateValue= date.toString();


  @override
  Widget build(BuildContext context) {



    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(dateValue, style: TextStyle(fontSize: 15, color: Colors.white),),
          Material(
        borderRadius: BorderRadius.circular(15),
        elevation: 5,
        color: Colors.deepOrangeAccent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(scoreValue),
          ),
            textStyle: TextStyle(fontSize: 20, color: Colors.white),
          ),
    ])
    );

  }
}

