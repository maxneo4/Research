
import 'package:shared_preferences/shared_preferences.dart';

class Urls{

  void guardarUrl(String title, String url) async {
    List<String> datos=[title,url];
    final prefs = await SharedPreferences.getInstance();
    List<String> counter = prefs.getStringList('datos') ?? [];
    prefs.setStringList('datos', datos+counter);
  }

  Future<List<String>> leerUrl() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> counter = prefs.getStringList('datos') ?? [];
    return counter;
  }

  void borrarUrl(String title) async{
    List<String> fin=[];
    final prefs = await SharedPreferences.getInstance();
    List<String> counter = prefs.getStringList('datos') ?? ["nada"];
    if(counter!=["nada"]){
      for(int i=0; i<counter.length; i++){
        if(counter[i]!=title){
          fin.add(counter[i]);
        }else{
          i++;
        }
      }
    }
    prefs.setStringList('datos', fin);

  }

}

class StateUrl{

  void guardarState(String url, String questions) async {
    questions=questions.replaceAll(" ", '').replaceAll("[", '').replaceAll(']', '');
    List<String> datos=[url,questions];
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('state', datos);
  }

  Future<List<String>> leerState() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> counter = prefs.getStringList('state') ?? [];
    return counter;
  }

  void borrarState() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('state');
  }

}