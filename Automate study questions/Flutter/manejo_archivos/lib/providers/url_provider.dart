
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Url with ChangeNotifier {
  String _text = "";
  String _pos="";

  get mess {
    return this._text;
  }

  set mess(String a) {
    this._text = a;
  }

 get pos {
    return this._pos;
  }

  set pos(String a) {
    this._pos = a;
  }

  void notifi() {
    notifyListeners();
  }

  Future<String> cargar(String a) async {
    try {
      final http.Response response = await http.get(a);
      if (response.statusCode == 200) {
        //this._text = utf8.decode(response.body.runes.toList());
        return response.body;
      } else {
        return "Link no Funciona";
      }
    } catch (e) {
      print('object');
      return "Link no Funciona";
    }
  }

  Stream cargar2(String a) async* {
    final http.Response response = await http.get(a);
    yield this._text = response.body;
  }
}
