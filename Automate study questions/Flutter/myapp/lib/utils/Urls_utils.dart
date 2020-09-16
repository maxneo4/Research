
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
    List<String> counter = prefs.getStringList('datos') ?? [""];

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