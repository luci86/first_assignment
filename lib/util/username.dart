import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Username extends ChangeNotifier {



  String username = '';

   changeUsername(String newString) {

    username = newString;
    username.toString();
    notifyListeners();
    print(username);
  }

}