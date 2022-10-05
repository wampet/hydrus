
import 'package:flutter/material.dart';
class VerifyAccountModel { }

class OpenAccountViewModel extends ChangeNotifier {
  String _email = '';


  String get email => _email;

  setEmail(String email) {
    _email = email;
    notifyListeners();
  }


}
