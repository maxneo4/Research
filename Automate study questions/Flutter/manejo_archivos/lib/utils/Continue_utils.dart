

import 'package:manejo_archivos/providers/Datos_provider.dart';
import 'package:manejo_archivos/providers/worong_provider.dart';
import 'package:provider/provider.dart';

class Continue_utils{

  void llenarC(context, String num){
    final datos = Provider.of<Datos>(context, listen: false);
    final wrong = Provider.of<Wrong>(context, listen: false);

    List<String> nq=num.split(",");

    nq.forEach((element) { 
      wrong.Nq=datos.pnq(int.parse(element)-1);
      wrong.Q=datos.PQ(int.parse(element)-1);
      wrong.A=datos.PA(int.parse(element)-1);
    });
  }

}