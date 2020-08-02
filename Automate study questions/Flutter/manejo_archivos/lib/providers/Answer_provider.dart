import 'package:flutter/material.dart';

class Answer with ChangeNotifier {
  String _ans = "";

  set answer(String a) {
    this._ans = a;
  }

  get answer {
      return this._ans;
  }

  void notifi() {
    notifyListeners();
  }
}
