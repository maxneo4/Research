import 'package:flutter/material.dart';
import 'package:manejo_archivos/providers/Contador_provider.dart';
import 'package:manejo_archivos/providers/Datos_provider.dart';
import 'package:manejo_archivos/providers/type_provider.dart';
import 'package:manejo_archivos/providers/worong_provider.dart';
import 'package:provider/provider.dart';

class FinalPage extends StatelessWidget {
  const FinalPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contador = Provider.of<Contador>(context, listen: false);
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
                    "Correctas: " + contador.Rans.toString(),
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
                    "Incorrectas: " + contador.Wans.toString(),
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
                    "Saltadas: " + contador.Jans.toString(),
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
              SizedBox(
                height: 70,
              ),
              contador.Wans>0? malas(context):new Container(),
              butto(context)
            ],
          )),
    );
  }

  Widget butto(context) {
    final datos = Provider.of<Datos>(context, listen: false);
    final cont = Provider.of<Contador>(context, listen: false);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
            child: Text("Reintentar"),
            color: Colors.cyan,
            onPressed: () {
              datos.P = 0;
              datos.notifi();
              cont.reset();
              Navigator.pop(context);
            }),
        SizedBox(
          width: 15,
        ),
        RaisedButton(
            child: Text("Finalizar"), 
            color: Colors.cyan, 
            onPressed: () {
              Navigator.pushNamed(context, 'Page');
            }),
      ],
    );
  }

  Widget malas(context){
    final cont = Provider.of<Contador>(context, listen: false);
    final wrong = Provider.of<Wrong>(context, listen: false);
    final tip = Provider.of<Tipo>(context, listen: false);
    return Container(
      child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            child: Text("Desear reintentar las Incorrectas?"), 
            color: Colors.cyan, 
            onPressed: () {
              tip.Ty=true;
              wrong.P=0;
              print(wrong.P);
              cont.Wans=0;
              Navigator.pushNamed(context, "Wrong");
            }),
        ],
      ),
    );
  }
}