import 'package:flutter/material.dart';
import 'dart:async';

class RapidFireScreen extends StatefulWidget {
  @override
  State<RapidFireScreen> createState() => _RapidFireScreenState();
}

class _RapidFireScreenState extends State<RapidFireScreen> with TickerProviderStateMixin {
  bool redIsVisible = true;
  bool greenIsVisible = true;

  

  @override
  void initState() {

    Future.delayed(Duration(seconds: 10), () {
      int counter = 5;

      final loopTimer =
          Timer.periodic(const Duration(seconds: 10), (loopTimer) {
        setState(() {
          redIsVisible = true;
          greenIsVisible = false;
        });
        print('red is $redIsVisible and green is $greenIsVisible');
        final timerRed = Timer(const Duration(seconds: 7), () {
          setState(() {
            redIsVisible = false;
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

    // AnimationController controller = AnimationController(
    //     vsync: this,
    //     duration: Duration(seconds: 1),
    //     upperBound: 1
    // );
    // Animation animation = CurvedAnimation(
    //     parent: controller,
    //     curve: Curves.decelerate);
    // controller.forward();
    // controller.addListener(() {setState(() {});}
    // );

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
            // Container(
            Hero(tag: "target",
                  child: Image.asset('images/unnamed.png',

                      // scale: animation.value*100)
            )),
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
