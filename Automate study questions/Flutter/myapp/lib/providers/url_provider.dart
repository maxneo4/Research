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
    print(a);
    try {
      final http.Response response = await http.get(a);
      if(response.statusCode==200){
        print(response.body);
        return response.body;

      }else{
        return "Link no Funciona";
      }
    } catch (e) {
      print(e);
      return "Se ha produciodo un error";
    }
  }

  Stream cargar2(String a) async* {
    final http.Response response = await http.get(a);
    yield this._text = response.body;
  }
}
