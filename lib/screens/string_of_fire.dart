import 'package:first_project/screens/rapidfire_screen1.dart';
import 'package:first_project/screens/rapidfire_screen2.dart';
import 'package:first_project/screens/rapidfire_screen3.dart';
import 'package:flutter/material.dart';


enum Choice { tenSec, twentySec }

extension ParseToBool on Choice {
  String tenSeconds() {
    return this.toString().split('.').first;
  }
}

Choice tenSeconds = Choice.tenSec;
String checker = 'tenSeconds';

class StringChoice extends StatefulWidget {
  @override
  State<StringChoice> createState() => _StringChoiceState();
}

class _StringChoiceState extends State<StringChoice> {
  ButtonStyle style = ElevatedButton.styleFrom(
    elevation: 3,
    backgroundColor: Colors.transparent,

  );
  // String dropdownValue = duration.first;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 150,
              child: TextButton(
                  style: style,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RapidFireScreen()));
                  },
                  child: Image.asset('images/32.png')),
            ),
            Hero(tag: 'target', child:
            Container(
              width: 100,
              height: 100,
              child: Image.asset('images/unnamed.png'),
            ),),
            PopupMenuButton(

              child: Image.asset('images/22.png', height: 200,),
              itemBuilder: (BuildContext contex) => <PopupMenuEntry<Choice>>[
                const PopupMenuItem(
                    child: Text('10 sec'), value: Choice.tenSec),
                const PopupMenuItem(
                  child: Text('20 sec'),
                  value: Choice.twentySec,
                )
              ],
              onSelected: (choice) {
                switch (choice) {
                  case Choice.tenSec:
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RapidFireScreen10Sec()));
                    break;
                  case Choice.twentySec:
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RapidFireScreen20Sec()));
                    break;
                }
              },
            ),
          ],
        ),
      ),
    ));
  }
}
