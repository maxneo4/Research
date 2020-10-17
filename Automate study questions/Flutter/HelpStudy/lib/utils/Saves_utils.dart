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
  void guardarUrl(String title, String url) async {
    List<String> datos = [title, url];
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
      for (int i = 0; i < counter.length; i += 2) {
        if (counter[i] != title) {
          fin.add(counter[i]);
          fin.add(counter[i + 1]);
        }
      }
    }
    prefs.setStringList('Urls', fin);
  }

}

class SaveState{

  void guardarName(String name, String url, String type) async {
    List<String> datos = [type, name, url,"","0","0","0",""];
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('state', datos);
  }  
  
  //type, name, url, malas, buenas, saltadas, pos, preguntas

  void guardarMalas(String malas)async{
    final prefs = await SharedPreferences.getInstance();
    List<dynamic> counter = prefs.getStringList('state') ?? [];
    //print("sin datos"+counter.toString()+"  "+counter[6]);
    counter[3]=malas;
    //print("con datos"+counter.toString()+"  "+counter[2]);
    prefs.setStringList('state', counter);
  }

  void guardarBuenas(String buenas)async{
    final prefs = await SharedPreferences.getInstance();
    List<dynamic> counter = prefs.getStringList('state') ?? [];
    counter[4]=buenas;
    prefs.setStringList('state', counter);
  }

  void guardarSaltadas(String saltadas)async{
    final prefs = await SharedPreferences.getInstance();
    List<dynamic> counter = prefs.getStringList('state') ?? [];
    counter[5]=saltadas;
    prefs.setStringList('state', counter);
  }

  void guardarPos(String pos)async{
    final prefs = await SharedPreferences.getInstance();
    List<dynamic> counter = prefs.getStringList('state') ?? [];
    //print("sin datos"+counter.toString()+"  "+counter[5]);
    counter[6]=pos;
    //print("con datos"+counter.toString());
    prefs.setStringList('state', counter);
  }

  void guardarPreguntas(String preguntas)async{
    final prefs = await SharedPreferences.getInstance();
    List<dynamic> counter = prefs.getStringList('state') ?? [];
    counter[7]=preguntas;
    prefs.setStringList('state', counter);
    //print(counter);
  }

  Future<List<dynamic>> leerDatos() async {
    final prefs = await SharedPreferences.getInstance();
    List<dynamic> counter = prefs.getStringList('state') ?? [];
    return counter;
  }

  void borrar() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('state');
  }

  void reset() async{
    final prefs = await SharedPreferences.getInstance();
    List<dynamic> counter = prefs.getStringList('state') ?? [];
    counter[3]="";
    counter[4]="0";
    counter[5]="0";
    prefs.setStringList('state', counter);
  }

}