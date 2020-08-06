import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Url with ChangeNotifier {
  String _text = "";

  get mess {
    return this._text;
  }

  set mess(String a) {
    this._text = a;
  }

  void notifi() {
    notifyListeners();
  }

  Future<String> cargar(String a) async {
    try {
      final http.Response response = await http.get(a);
      if (response.statusCode == 200) {
        this._text = response.body;
        return response.body;
      } else {
        return "Link no Funciona";
      }
    } catch (e) {
      return "Link no Funciona";
    }
  }

  Stream cargar2(String a) async* {
    final http.Response response = await http.get(a);
    yield this._text = response.body;
  }
}
