import 'package:flutter/material.dart';
import 'dart:async';

class RapidFireScreen10Sec extends StatefulWidget {
  @override
  State<RapidFireScreen10Sec> createState() => _RapidFireScreen10SecState();
}

class _RapidFireScreen10SecState extends State<RapidFireScreen10Sec> {
  bool redIsVisible = true;
  bool greenIsVisible = true;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 10), () {
      int counter = 6;

      final loopTimer =
          Timer.periodic(const Duration(seconds: 10), (loopTimer) {
        setState(() {
          redIsVisible = false;
          greenIsVisible = true;
        });
        print('red is $redIsVisible and green is $greenIsVisible');
        final timerRed = Timer(const Duration(seconds: 30), () {
          setState(() {
            redIsVisible = true;
            greenIsVisible = true;
          });
          print('green is $greenIsVisible and red is $redIsVisible');
        });
        counter--;
        if (counter == 0) {
          setState(() {
            Navigator.pop(context);
          });
          loopTimer.cancel();
        }
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Visibility(
                maintainSemantics: true,
                maintainAnimation: true,
                maintainSize: true,
                maintainInteractivity: true,
                maintainState: true,
                visible: greenIsVisible,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.green),
                ),
              ),
            ),
            Image.asset('images/unnamed.png'),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Visibility(
                maintainState: true,
                maintainInteractivity: true,
                maintainSize: true,
                maintainAnimation: true,
                maintainSemantics: true,
                visible: redIsVisible,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
