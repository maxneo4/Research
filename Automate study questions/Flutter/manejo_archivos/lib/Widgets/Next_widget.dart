import 'package:flutter/material.dart';
import 'package:manejo_archivos/providers/Answer_provider.dart';
import 'package:manejo_archivos/providers/Contador_provider.dart';
import 'package:manejo_archivos/providers/Datos_provider.dart';
import 'package:provider/provider.dart';

class Next extends StatelessWidget {
  const Next({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final datos = Provider.of<Datos>(context, listen: false);
    final answer = Provider.of<Answer>(context, listen: false);
    final contador = Provider.of<Contador>(context, listen: false);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 60),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  contador.Wrong();
                  datos.pos();
                  datos.notifi();
                },
                child: Text("Saltar"),
                color: Colors.red,
                
              ),
              SizedBox(
                width: 60,
              ),
              RaisedButton(
                onPressed: () {
                  if(datos.A==answer.answer){
                    contador.Right();
                  }else{
                    contador.Wrong();
                  }
                  answer.notifi();
                  datos.pos();
                  datos.notifi();
                },
                child: Text("Siguiente"),
                color: Colors.cyan,
              ),
            ],
          )
        ],
      ),
    );
  }
}
