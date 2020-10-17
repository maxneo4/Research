import 'package:flutter/material.dart';
import 'package:manejo_archivos/providers/Contador_Answers_provider.dart';
import 'package:manejo_archivos/providers/Numero_Question_provider.dart';
import 'package:manejo_archivos/utils/Saves_utils.dart';
import 'package:provider/provider.dart';

class Final extends StatelessWidget {
  const Final({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contador = Provider.of<ContadorAnswer>(context, listen: false);

    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Final",
                    style: TextStyle(fontSize: 40),
                  )
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Correctas: " + contador.Corrects.toString(),
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Incorrectas: " + (contador.Incorrects.length).toString(),
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Saltadas: " + contador.Jumps.toString(),
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
              SizedBox(
                height: 70,
              ),
              contador.Incorrects.length>0? malas(context):new Container(),
              butto(context)
            ],
          )),
    );
  }

  Widget butto(context) {
    final contador = Provider.of<ContadorAnswer>(context, listen: false);
    final numeros = Provider.of<NumeroQuestion>(context, listen: false);
    SaveState state = new SaveState();
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
            child: Text("Reintentar"),
            color: Colors.cyan,
            onPressed: () {
              numeros.p=0;
              numeros.notifi();
              contador.reset();
              state.reset();
              Navigator.popAndPushNamed(context, "questions");
            }),
        SizedBox(
          width: 15,
        ),
        RaisedButton(
            child: Text("Finalizar"), 
            color: Colors.cyan, 
            onPressed: () {
              state.borrar();
              contador.reset();
              Navigator.popAndPushNamed(context, 'main');
            }),
      ],
    );
  }

  Widget malas(context){
    final contador = Provider.of<ContadorAnswer>(context, listen: false);
    final numeros = Provider.of<NumeroQuestion>(context, listen: false);


    return Container(
      child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            child: Text("Desear reintentar las Incorrectas?"), 
            color: Colors.cyan, 
            onPressed: () {
              numeros.nq=contador.Incorrects;
              numeros.p=0;
              contador.Incorrects=[];
              Navigator.popAndPushNamed(context, "questions");
            }),
        ],
      ),
    );
  }
}