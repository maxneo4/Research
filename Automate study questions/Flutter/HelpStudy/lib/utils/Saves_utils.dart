import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LeerUrls {
  Future<String> cargar(String a) async{
    try {
      final http.Response response = await http.get(a);
      if (response.statusCode == 200) {
        //this._text = utf8.decode(response.body.runes.toList());
        return response.body;
      } else {
        return "404";
      }
    } catch (e) {
      return "error";
    }
  }
}

class SavesUrls {
  void guardarUrl(String title, String url, String numerPreg) async {
    List<String> datos = [title, url, numerPreg];
    final prefs = await SharedPreferences.getInstance();
    List<String> counter = prefs.getStringList('Urls') ?? [];
    prefs.setStringList('Urls', datos + counter);
  }

  Future<List<dynamic>> leerUrl() async {
    final prefs = await SharedPreferences.getInstance();
    List<dynamic> counter = prefs.getStringList('Urls') ?? [];
    return counter;
  }

  void borrarUrl(String title) async {
    List<String> fin = [];
    final prefs = await SharedPreferences.getInstance();
    List<String> counter = prefs.getStringList('Urls') ?? [];
    if (counter.isNotEmpty) {
      for (int i = 0; i < counter.length; i += 3) {
        if (counter[i] != title) {
          fin.add(counter[i]);
          fin.add(counter[i + 1]);
          fin.add(counter[i + 2]);
        }
      }
    }
    prefs.setStringList('Urls', fin);
  }

}
