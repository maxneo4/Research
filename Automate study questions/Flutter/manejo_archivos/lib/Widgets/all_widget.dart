import 'package:flutter/material.dart';
import 'package:manejo_archivos/Widgets/Answer_widget.dart';
import 'package:manejo_archivos/Widgets/Next_widget.dart';
import 'package:manejo_archivos/Widgets/Question_widget.dart';
import 'package:manejo_archivos/providers/Contador_provider.dart';
import 'package:manejo_archivos/providers/Datos_provider.dart';
import 'package:provider/provider.dart';

class AllWidgets extends StatelessWidget {
  const AllWidgets({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
        child: all(context)
    );
  }

  Widget all(context){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: <Widget>[
          _reset(context),
          Questions(),
          SizedBox(
            height: 30,
          ),
          Answer_widget(),
          SizedBox(
            height: 30,
          ),
          Next(),
        ],
      ),
    );
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
                  datos.P = 0;
                  datos.notifi();
                  cont.reset();
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
