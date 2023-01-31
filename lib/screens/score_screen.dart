import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/screens/add_task_screen.dart';

class ScoreScreen extends StatefulWidget {

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {

  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  @override
  void initState(){
    super.initState();
    getCurrentUser();

  }

   void getCurrentUser() async {
     try {
    Firebase.initializeApp();
     final user = _auth.currentUser;
       if (user != null) {
         loggedInUser = user;
       }
     } catch (e) {
       print(e);
     }
   }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child:Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepOrangeAccent,
            leading: null,
            actions: [IconButton(onPressed: () {_auth.signOut(); Navigator.pop(context);}, icon: Icon(Icons.close))],
          ),
          backgroundColor: Colors.blueGrey,
          floatingActionButton: FloatingActionButton( backgroundColor: Colors.deepOrangeAccent,
            onPressed: (){
            showModalBottomSheet(context: context, builder: (context) =>  AddTaskScreen(),
            );
            },
          child: const Icon (Icons.add, size: 40, color: Colors.white,),),

        )

          );
  }
}