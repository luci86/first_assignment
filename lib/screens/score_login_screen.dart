import 'package:flutter/material.dart';
import 'package:first_project/screens/score_registration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/screens/score_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:first_project/util/username.dart';
import 'package:provider/provider.dart';



// String username = '';

class ScoreScreenLog extends StatefulWidget with ChangeNotifier {

  @override
  State<ScoreScreenLog> createState() => _ScoreScreenStateLog();
}

class _ScoreScreenStateLog extends State<ScoreScreenLog> with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;

  String password = '';


  @override
  Widget build(BuildContext context) {
    String username = Provider
        .of<Username>(context)
        .username;

     changeUsername(String newString) {
      username = newString;
      notifyListeners();
      print(username);
     }


      final ButtonStyle style = ElevatedButton.styleFrom(
          textStyle: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black,),
          backgroundColor: Colors.deepOrangeAccent);

      return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.blueGrey,
            body: ModalProgressHUD(
              inAsyncCall: showSpinner,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Column(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextField(textAlign: TextAlign.center,
                        onChanged: (value) {
                          changeUsername(value);
                        }),
                    TextField(textAlign: TextAlign.center,
                      obscureText: true,
                      onChanged: (value) {
                        password = value;
                      },),
                    SizedBox(height: 30,),
                    TextButton(onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: username, password: password);
                        if (user != null) {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => ScoreScreen()));
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      }
                      catch (e) {
                        print(e);
                      }
                      changeUsername(username);
                    }, child: Text('Log In'), style: style,),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) => ScoreScreenReg()));
                      },
                      child: Text('Register'), style: style,)
                  ],
                ),
              ),
            ),
          )

      );
    }
  }

