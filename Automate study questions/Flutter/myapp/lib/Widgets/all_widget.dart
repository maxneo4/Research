import 'package:flutter/material.dart';
import 'package:myapp/providers/Contador_provider.dart';
import 'package:myapp/providers/Datos_provider.dart';
import 'package:myapp/providers/type_provider.dart';
import 'package:myapp/providers/worong_provider.dart';

import 'package:provider/provider.dart';

import 'Answer_widget.dart';
import 'Next_widget.dart';
import 'Question_widget.dart';

class AllWidgets extends StatelessWidget {
  const AllWidgets({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final tip = Provider.of<Tipo>(context, listen: false);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: <Widget>[
          _reset(context),
          Questions(type: tip.Ty,),
          SizedBox(
            height: 30,
          ),
          Answer_widget(type: tip.Ty,),
          SizedBox(
            height: 30,
          ),
          Next(type: tip.Ty,),
        ],
      ),
    );
  }

  Widget all(context) {
    return Container();
  }

  Widget _reset(context) {
    return Container(
        alignment: Alignment.bottomLeft,
        child: ButtonTheme(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          minWidth: 60,
          buttonColor: Colors.black38,
          child: RaisedButton(
            onPressed: () {
              _Shure(context);
            },
            child: Icon(Icons.autorenew),
          ),
        ));
  }

  void _Shure(BuildContext context) {
    final datos = Provider.of<Datos>(context);
    final cont = Provider.of<Contador>(context, listen: false);
    final tipo = Provider.of<Tipo>(context, listen: false);
    final wron = Provider.of<Wrong>(context, listen: false);
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            content: Container(
              child: Text("¿Desea reiniciar?"),
            ),
            actions: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("No"),
                color: Colors.red,
              ),
              RaisedButton(
                onPressed: () {
                 if(tipo.Ty==false){
                    datos.P = 0;
                  datos.notifi();
                  cont.reset();
                 }else{
                   wron.P=0;
                   wron.noti();
                   cont.Wans=0;
                 }
                  Navigator.of(context).pop();
                },
                child: Text("si"),
                color: Colors.green,
              )
            ],
          );
        });
  }
}
